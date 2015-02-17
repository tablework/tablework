class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!
  enumerize :plan, in: [:Yearly, :Subcription]
  enumerize :payment_type, in: [:CreditCard, :Paypal]

  def create_user_payment(plantype)
    e = UserPayment.new(user_id: current_user.id, payment_type: :CreditCard, plantype: plantype)
    e.save
  end

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
    nameoncard = params[:nameoncard]
    cardnumber = params[:cardnumber]
    nonce = params[:payment_method_nonce]
    plan = params[:plan]
    customer = brain_search.first || brain_customer 
    if plan != :Yearly
      brainsub(customer, nonce)
    else
      brainpay(customer, nonce)
    end
    create_user_payment(plan)
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
    
    result = Braintree::PaymentMethod.create(
      :customer_id => customer.id,
      :payment_method_nonce => nonce
    )
    result = Braintree::Subscription.create(
      :payment_method_token => result.payment_method.token,
      :plan_id => "hs8b"
    )
    if result.success?
      puts "success!: #{result.subscription.id}"
    elsif result.transaction
      puts "Error processing transaction:"
      puts "  code: #{result.subscription.processor_response_code}"
      puts "  text: #{result.subscription.processor_response_text}"
    else
      p result.errors
    end
  end

  def brainsuspend
  
  end

  def braincancel
  
  end

  

end