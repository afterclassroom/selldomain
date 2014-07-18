class SubscriptionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:notification]
  def index

  end
  def create

  end

  def new
    profile = Paypal::Payment::Recurring.new(
      :start_date => Time.now,
      :description => "Pay to buy this domain(test.com)?",#NOTE: this description and previous description must be the same
      :billing => {
        :period        => :Month, # ie.) :Month, :Week
        :frequency     => 12,
        :amount        => 10.00,
        :currency_code => :USD # if nil, PayPal use USD as default
      }
      )
    token = params[:token]

    Paypal.sandbox! if Rails.env.development?
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

    puts('=========')
    puts(params[:domain_info])
    puts('=========')

    #NOTE: QUERY PROFILE ID TO TEST
    begin
      response = request.subscription(@profile_id)
      @presponse = response.to_json
    rescue => e
      puts "bug: #{e.message}"
      puts e.to_json
      puts "#{e.backtrace.join("\n")}"
    end
  end

  #check out for recurring
  def paypal_checkout
    #We will use this params[:domain_info] to find out which domain user want to buy
    #at which price
    #NOTE: for now, just set 9$ to be the price of domain to test
    Paypal.sandbox! if Rails.env.development?
    request = Paypal::Express::Request.new(
      :username   => PAYPAL_API[:username],
      :password   => PAYPAL_API[:password],
      :signature  => PAYPAL_API[:signature]
      )
    payment_request = Paypal::Payment::Request.new(
      :currency_code => :USD, # if nil, PayPal use USD as default
      :billing_type  => :RecurringPayments,
      :billing_agreement_description => "Pay to buy this domain(test.com)?"
      )
    response = request.setup(
      payment_request,
      new_subscription_url(:domain_info => 1),
      root_url
      )
    @my_redirect_uri = response.redirect_uri
  end

  def notification
    begin
      Paypal.sandbox! if Rails.env.development?#NOTE: this is very important for development, OR ELSE, it will failed ALWAYS
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

  #check out for express
  def paypal_checkout_express
    Paypal.sandbox! if Rails.env.development?
    request = Paypal::Express::Request.new(
      :username   => PAYPAL_API[:username],
      :password   => PAYPAL_API[:password],
      :signature  => PAYPAL_API[:signature]
      )
    payment_request = Paypal::Payment::Request.new(
      :currency_code => :USD, # if nil, PayPal use USD as default
      :description   => "Pay to buy this domain(express)?",    # item description
      :quantity      => 1,      # item quantity
      :amount        => 10.00,   # item value
      :custom_fields => {
        CARTBORDERCOLOR: "C00000",
        LOGOIMG: "https://example.com/logo.png"
      }
      )

    response = request.setup(
      payment_request,
      paypal_express_url,
      root_url
      )
    @my_redirect_uri = response.redirect_uri
  end

  def paypal_express
    token = params[:token]
    payer_id = params[:PayerID]
    Paypal.sandbox! if Rails.env.development?

    begin
      request = Paypal::Express::Request.new(
        :username   => PAYPAL_API[:username],
        :password   => PAYPAL_API[:password],
        :signature  => PAYPAL_API[:signature]
        )

      payment_request = Paypal::Payment::Request.new(
      :currency_code => :USD, # if nil, PayPal use USD as default
      :description   => "Pay to buy this domain(express)?",    # item description
      :quantity      => 1,      # item quantity
      :amount        => 10.00,   # item value
      :custom_fields => {
        CARTBORDERCOLOR: "C00000",
        LOGOIMG: "https://example.com/logo.png"
      }
      )

      response = request.checkout!(
        token,
        payer_id,
        payment_request
        )

      @presponse = response.to_json
      puts('==========')
      puts(@presponse)
      puts('==========')

      # if !@presponse.payment_info.nil? && @presponse.payment_info.payment_status == "Completed"
      #   #buy domain
      #   puts('=========')
      #   puts('buy domain')
      #   puts('=========')
      # end


    rescue => e
      puts "bug: #{e.message}"
      puts e.to_json
      puts "#{e.backtrace.join("\n")}"
    end
  end








end
