class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def show
    @client_token = Braintree::ClientToken.generate
  end

  def brain_search
    search_results = Braintree::Customer.search do |search|
      search.email.is current_user.email
    end
    search_results
  end

  def brain_customer
    brain_customer = Braintree::Customer.create(
      :email => current_user.email
    )
    brain_customer
  end

  def brainprocess
    binding.pry
    nameoncard = params[:nameoncard]
    cardnumber = params[:cardnumber]
    nonce = params[:payment_method_nonce]
    plan = params[:plan]
    customer = brain_search.first || brain_customer 
    if plan == "Yearly"
      brainsub(customer, nonce)
    else
      brainpay(customer, nonce)
    end
    redirect_to payments_path
  end

  def brainpay(customer, nonce)
    # 5105105105105100
    result = Braintree::Transaction.sale(
      :amount => "69.99",
      :payment_method_nonce => nonce,
      :customer => {
          :first_name => current_user.first_name,
          :last_name => current_user.last_name,
          :email => "test@gmail.com"
      }
    )
    if result.success?
      puts "success!: #{result.transaction.id}"
    elsif result.transaction
      puts "Error processing transaction:"
      puts "  code: #{result.transaction.processor_response_code}"
      puts "  text: #{result.transaction.processor_response_text}"
    else
      p result.errors
    end
  end

  def brainsub(customer, nonce)
    nameoncard = params[:nameoncard]
    cardnumber = params[:cardnumber]

    result = Braintree::PaymentMethod.create(
      :customer_id => customer.id,
      :payment_method_nonce => params[:payment_method_nonce]
    )
    result = Braintree::Subscription.create(
      :payment_method_token => "the_token",
      :plan_id => "hs8b"
    )
  end

  def brainsuspend
  
  end

  def braincancel
  
  end

  

end