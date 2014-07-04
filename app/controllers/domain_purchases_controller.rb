require 'authentication'
require 'certification'
require 'connection'
require 'dns'
require 'domains'
require 'godaddy_reseller'
require 'product_table'
require 'product_price'
require 'country_table'
require 'util'
require 'wapi'

class DomainPurchasesController < ApplicationController
  before_filter :prepare, :except => [:confirm_purchase, :get_state, :get_price]
  http_basic_authenticate_with :name => "gotoclassroom", :password => "vietnam2011"

  def query_poll
    #DATNT: this action should only called once per day

    polled_result = @godaddy.query_poll

    polled_result["REPORT"]["ITEM"].each do |item|
      PollResult.create(
        orderid: item["orderid"],
        roid: item["roid"],
        riid: item["riid"],
        resourceid: item["resourceid"],
        status: item["status"],
        timestamp: item["timestamp"]
        )
    end

    render :text => "poll"
  end

  def purchase_privacy
    ipoll = PollResult.last#just for testing
    order = PurchaseOrder.last

    new_priv = @godaddy.domain_name_privacy_purchase_certification_from_db(ipoll.orderid, order.user_id, order.domain,ipoll.resourceid)

    render :text => "#{new_priv}"
  end

  def info_query
    ipoll = PollResult.last#just for testing

    STDERR.print("5. Domain Name Information Query:\n")
    result = @godaddy.info_by_resource_id(ipoll.resourceid)
    STDERR.print("++ #{result.inspect}\n\n")

    render :text => result
  end

  def check_domain
    session['domain'] = nil
    session['complete'] = nil
    session['contact_info'] = nil
    session['order_item'] = nil
    session['user_password'] = nil

    if params[:domain]
      domain = params[:domain][:name]+"."+params[:domain][:type]
      domain = domain.upcase
      begin
        result = @godaddy.check_availability([domain])
      rescue => e
        message = e.message
      end

      @domain = domain
      if !result.nil? && result[domain] == true
        session['domain'] ||= {}
        session['domain']['name'] = params[:domain][:name].downcase
        session['domain']['type'] = params[:domain][:type].downcase

        session['complete'] ||= {}
        session['complete']['step1'] = true
        @check = "true"
      else
        session['complete'] ||= {}
        session['complete']['step1'] = false
        @message = message ? message : ''
        @check = "false"
      end
    end
  end

  def get_price
    if params[:top_level_domain] && params[:num_years]
      product_price = GoDaddyReseller::ProductPrice.domain_registration_price(params[:top_level_domain], params[:num_years])
      render :text => product_price.to_s
    end
  end

  def get_state
    if params[:country] && params[:country] != ''
      @list_state = GoDaddyReseller::CountryTable::PRODUCT_COUNTRIES[params[:country]]
      #render :text => @list_state.to_json
      render :layout => false
    else
      render :nothing => true
    end
  end

  def register_domain
    if session['complete'] && session['complete']['step1'] == true
      @list_country = GoDaddyReseller::CountryTable::PRODUCT_COUNTRIES.keys
      @list_state = GoDaddyReseller::CountryTable::PRODUCT_COUNTRIES[@list_country[0]]

      if params[:contact]
        #step1:check valid data
        begin
          user_hash = {
            :fname => params[:contact][:fname],
            :lname => params[:contact][:lname],
            :email => params[:contact][:email],
            :org   => params[:contact][:org],
            :sa1   => params[:contact][:sa1],
            :city  => params[:contact][:city],
            :sp    => params[:contact][:sp],
            :pc    => params[:contact][:pc],
            :cc    => params[:contact][:cc],
            :phone => params[:contact][:phone],
            :fax   => params[:contact][:fax]
          }

          domainContacts = {
            :registrant => user_hash,
            :admin => user_hash,
            :billing => user_hash,
            :tech => user_hash
          }

          domainDataArray = {
            :sld => session['domain']['name'],
            :tld => session['domain']['type'],
            :period => params[:order][:term]
          }

          result = @godaddy.validate_registration(domainContacts, domainDataArray)

          if !result.nil? &&  result.has_key?("success")
            #step2:save data to session
            session['contact_info'] ||= {}
            session['contact_info']['fname'] = params[:contact][:fname]
            session['contact_info']['lname'] = params[:contact][:lname]
            session['contact_info']['org'] = params[:contact][:org]
            session['contact_info']['email'] = params[:contact][:email]
            session['contact_info']['sa1'] = params[:contact][:sa1]
            session['contact_info']['sa2'] = params[:contact][:sa2]
            session['contact_info']['city'] = params[:contact][:city]
            session['contact_info']['sp'] = params[:contact][:sp]
            session['contact_info']['pc'] = params[:contact][:pc]
            session['contact_info']['cc'] = params[:contact][:cc]
            session['contact_info']['phone'] = params[:contact][:phone]
            session['contact_info']['fax'] = params[:contact][:fax]

            product_id = GoDaddyReseller::ProductTable.domain_reg_id(session['domain']['type'], params[:order][:term])

            session['order_item'] ||= {}
            session['order_item']['product_id'] = product_id
            session['order_item']['term'] = params[:order][:term]
            session['order_item']['price_per_year'] = params[:order][:price_per_year]
            session['order_item']['total_price'] = params[:order][:total_price]

            if product_id != ""
              session['complete']['step2'] = true
              redirect_to "/domain_purchases/confirm_purchase"
            else
              @error = "Something is wrong!"
              session['complete']['step2'] = false
            end
          else
            @error = 'Error: '

            if result['failure']['contact']['error'].kind_of?(Array)
              result['failure']['contact']['error'].each_with_index do |e, index|
                @error +=  (index+1).to_s + e['desc'] + ': ' + e['displaystring'] +'.'
              end
            else
              @error += result['failure']['contact']['error']['desc'] + ': ' + result['failure']['contact']['error']['displaystring'] +'.'
            end
            session['complete']['step2'] = false
          end
        rescue => e
          @error = "Something is wrong!"
          session['complete']['step2'] = false
        end
      end
    else
      redirect_to "/"
    end
  end

  def confirm_purchase
  end

  def buy_domain
    if session['complete'] && session['complete']['step2'] == true

      contact = {
        :fname => session['contact_info']['fname'],
        :lname => session['contact_info']['lname'],
        :org => session['contact_info']['org'],
        :email => session['contact_info']['email'],
        :sa1 => session['contact_info']['sa1'],
        :sa2 => session['contact_info']['sa2'],
        :city => session['contact_info']['city'],
        :sp => session['contact_info']['sp'],
        :pc => session['contact_info']['pc'],
        :cc => session['contact_info']['cc'],
        :phone => session['contact_info']['phone'],
        :fax => session['contact_info']['fax']
      }

      order = {
        :productid => session['order_item']['product_id'],
        :quantity => 1
      }

      api_result = ""
      begin
        user_hash = contact

        @overall_domain = (session['domain']['name']).downcase
        #NOTE: We use default name server from godaddy, no need to input this parameter
        #name_servers = [
        #  { :name => 'ns1.example.com' }, { :name => 'ns2.example.com' }
        #]
        session['user_password'] = SecureRandom.hex(3)
        other_custom_value = {
          domain_value: @overall_domain,
          domain_type: session['domain']['type'],
          user_hash: user_hash,
          product_id: session['order_item']['product_id'],
          order_period: session['order_item']['term'],
          user_password: session['user_password']
        }

        new_reg = @godaddy.domain_name_registration_certification(other_custom_value)

        contact_info = ContactInfo.create!(contact)
        order_item = OrderItem.create!(order)

        purchase_order = PurchaseOrder.create(
          user_id: new_reg[:user_id],
          dbpuser_id: new_reg[:dbpuser_id],
          orderid: new_reg[:orderid],
          domain: @overall_domain,
          domain_type: session['domain']['type'],
          password: session['user_password'],
          contact_info_id: contact_info.id,
          order_item_id: order_item.id
          )

        account = {
          email: session['contact_info']['email'],
          password: session['user_password'],
          mngTRID: purchase_order.id
        }

        api_result = new_reg.merge(account)

        # result = update_dns('tiemtoi.com', '206.225.83.194', 'domain.gotoclassroom.com')
        # puts("=======")
        # puts(result)
        # puts("=======")
      rescue => e
        api_result = e
      end
      render :text => api_result
    else
      redirect_to "/"
    end
  end

  def update_dns(sDomain, ip, record_value, action = 'set')
    begin
      dnsRequest1 = {
        :action => action,
        :recType => 'A',
        :ttl => 432000,
        :recValue => ip
      }

      dnsRequest2 = {
        :action => action,
        :recType => 'CNAME',
        :ttl => 432000,
        :key => 'www',
        :recValue => record_value
      }

      dnsRequest3 = {
        :action => action,
        :recType => 'MX',
        :ttl => 432000,
        :recValue => record_value
      }

      dnsRequestArray = [
        [{:DNSRequest => dnsRequest1}],[{:DNSRequest => dnsRequest2}],[{:DNSRequest => dnsRequest3}]
      ]

      result = @godaddy.modify_dns(dnsRequestArray, sDomain)
      return result
    rescue
      return false
    end
  end

  def cancel_domain
    begin
      if params[:domain]

      end
    rescue

    end
  end

  protected

  def prepare
    @godaddy = GoDaddyReseller::API.new('502392', 'vietnam@!%DzXUlgM') # usually in an initializer
    @godaddy.authenticate # tests your login credentials

    # godaddy.run_certification # runs the cerfication script, required to open a production reseller account

    @godaddy.reset_certification_run
    #@overall_domain = "examplejun67"
  end
end