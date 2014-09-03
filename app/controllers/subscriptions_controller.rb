class SubscriptionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:notification]
  def index

  end
  def create

  end

  #check out for recurring
  def paypal_checkout_recurring
    description = "Pay to buy this domain."
    description += "Domain: " + (session['domain']['name']+"."+session['domain']['type']).downcase
    description += ".billing:"
    description += " -period: Month,"
    description += " -frequency: 12,"
    description += " -amount: " + session['order_item']['total_price'] +","
    description += " -currency_code: USD."

    Paypal.sandbox! #if Rails.env.development?
    request = Paypal::Express::Request.new(
      :username   => PAYPAL_API[:username],
      :password   => PAYPAL_API[:password],
      :signature  => PAYPAL_API[:signature]
      )
    payment_request = Paypal::Payment::Request.new(
      :currency_code => :USD, # if nil, PayPal use USD as default
      :billing_type  => :RecurringPayments,
      :billing_agreement_description => description
      )
    response = request.setup(
      payment_request,
      paypal_recurring_url,
      root_url
      )
    #@my_redirect_uri = response.redirect_uri

    redirect_to response.redirect_uri
  end

  def paypal_recurring
    description = "Pay to buy this domain."
    description += "Domain: " + (session['domain']['name']+"."+session['domain']['type']).downcase
    description += ".billing:"
    description += " -period: Month,"
    description += " -frequency: 12,"
    description += " -amount: " + session['order_item']['total_price'] +","
    description += " -currency_code: USD."

    profile = Paypal::Payment::Recurring.new(
      :start_date => Time.now,
      :description => description,
      :billing => {
        :period        => :Month,
        :frequency     => 12,
        :amount        => session['order_item']['total_price'],
        :currency_code => :USD
      }
      )
    token = params[:token]

    Paypal.sandbox! #if Rails.env.development?
    begin
      request = Paypal::Express::Request.new(
        :username   => PAYPAL_API[:username],
        :password   => PAYPAL_API[:password],
        :signature  => PAYPAL_API[:signature]
        )
      response = request.subscribe!(token, profile)
    rescue => e
      puts "bug: #{e.message}"
      puts e.to_json
      puts "#{e.backtrace.join("\n")}"
    end

    # inspect this attribute for more details
    response.recurring
    @profile_id = response.recurring.identifier # => profile_id    puts "**"
    PaypalProfile.create(profile_id: response.recurring.identifier)

    session['complete'] ||= {}
    if response.ack == "Success"
      session['complete']['step3'] = true
      redirect_to :controller => 'domain_purchases', :action => 'buy_domain'
    end



    #NOTE: QUERY PROFILE ID TO TEST
    # begin
    #   response = request.subscription(@profile_id)
    #   @presponse = response.to_json
    # rescue => e
    #   puts "bug: #{e.message}"
    #   puts e.to_json
    #   puts "#{e.backtrace.join("\n")}"
    # end
  end

  #check out for express
  def paypal_checkout_express
    description = "Pay to buy this domain."
    description += "Domain: " + (session['domain']['name']+"."+session['domain']['type']).downcase
    description += ".billing:"
    description += " -amount: " + session['order_item']['total_price'] +","
    description += " -currency_code: USD."

    Paypal.sandbox! #if Rails.env.development?
    request = Paypal::Express::Request.new(
      :username   => PAYPAL_API[:username],
      :password   => PAYPAL_API[:password],
      :signature  => PAYPAL_API[:signature]
      )
    payment_request = Paypal::Payment::Request.new(
      :currency_code => :USD,
      :description   => description,
      :quantity      => 1,
      :amount        => session['order_item']['total_price']
      # :custom_fields => {
      #   CARTBORDERCOLOR: "C00000",
      #   LOGOIMG: "https://example.com/logo.png"
      # }
      )

    response = request.setup(
      payment_request,
      paypal_express_url,
      root_url
      )
    #@my_redirect_uri = response.redirect_uri
    redirect_to response.redirect_uri
  end

  def paypal_express
    description = "Pay to buy this domain."
    description += "Domain: " + (session['domain']['name']+"."+session['domain']['type']).downcase
    description += ".billing:"
    description += " -amount: " + session['order_item']['total_price'] +","
    description += " -currency_code: USD."

    token = params[:token]
    payer_id = params[:PayerID]
    Paypal.sandbox! #if Rails.env.development?

    begin
      request = Paypal::Express::Request.new(
        :username   => PAYPAL_API[:username],
        :password   => PAYPAL_API[:password],
        :signature  => PAYPAL_API[:signature]
        )

      payment_request = Paypal::Payment::Request.new(
        :currency_code => :USD,
        :description   => description,
        :quantity      => 1,
        :amount        => session['order_item']['total_price']
      # :custom_fields => {
      #   CARTBORDERCOLOR: "C00000",
      #   LOGOIMG: "https://example.com/logo.png"
      # }
      )

      response = request.checkout!(
        token,
        payer_id,
        payment_request
        )

      session['complete'] ||= {}
      if response.ack == "Success"
        session['complete']['step3'] = true
        redirect_to :controller => 'domain_purchases', :action => 'buy_domain'
      end
    rescue => e
     session['complete']['step3'] = false
     puts "bug: #{e.message}"
     puts e.to_json
     puts "#{e.backtrace.join("\n")}"
   end
 end

 def notification
  begin
      Paypal.sandbox! #if Rails.env.development?#NOTE: this is very important for development, OR ELSE, it will failed ALWAYS
      result = Paypal::IPN.verify!(request.raw_post)
    rescue => e
      puts "bug: #{e.message}"
      puts e.to_json
      puts "#{e.backtrace.join("\n")}"
    end
    puts "** result == raw == #{result}"#NOTE: reulst should be == true
    if result == true
      PaypalNotification.create(
        txn_id: params[:txn_id],
        payer_id: params[:payer_id],
        params: params,
        txn_type: params[:txn_type]
        )
    end
  end

  def show
    begin
      request = Paypal::Express::Request.new(
        :username   => PAYPAL_API[:username],
        :password   => PAYPAL_API[:password],
        :signature  => PAYPAL_API[:signature]
        )
      profile_id = "I-4FYFKXM5DK8M"#This is for testing purpose only
      response = request.subscription(profile_id)
      @presponse = response.to_json
      # inspect this attribute for more details
      response.recurring
    rescue => e
      puts "bug: #{e.message}"
      puts e.to_json
      puts "#{e.backtrace.join("\n")}"
    end
  end






end
