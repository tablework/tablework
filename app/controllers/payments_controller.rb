class PaymentsController < ApplicationController
  extend Enumerize

  enumerize :plan, in: [:Yearly, :Subscription]
  enumerize :payment_type, in: [:CreditCard, :Paypal]
  enumerize :payment_status, in: [:Live, :Canceled]

  def create_user_payment(plantype, id)
    e = UserPayment.new(user_id: current_user.id, payment_type: :CreditCard, plantype: plantype, payment_id: id, status: :Live)
    e.save
    if plantype.to_sym == 'Subscription'
      current_user.subscription.update(subscription_plan_id: 2, expires_on: 1.month.from_now, uuid: id)
    else
      current_user.subscription.update(subscription_plan_id: 2, expires_on: 1.year.from_now, uuid: id)
    end
  end

  def thankyou

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
    return if brain_search.first
    customer = Braintree::Customer.create(
      :email => current_user.email
    )
    customer
  end

  def brainprocess
    nameoncard = params[:nameoncard]
    cardnumber = params[:cardnumber]
    nonce = params[:payment_method_nonce]
    plan = params[:plan]
    brain_customer
    customer = brain_search.first
    id = "NOID"
    if plan.to_sym != :Yearly
      id = brainsub(customer, nonce)
    else
      id = brainpay(customer, nonce)
    end
    create_user_payment(plan, id)
    redirect_to user_payments_path, notice: 'Payment completed'
  end

  def brainpay(customer, nonce)
    result = Braintree::PaymentMethod.create(
      :customer_id => customer.id,
      :payment_method_nonce => nonce
    )
    result = Braintree::Subscription.create(
      :payment_method_token => result.payment_method.token,
      :plan_id => "tablework-yearly"
    )
    result.subscription.id
  end

  def brainsub(customer, nonce)
    result = Braintree::PaymentMethod.create(
      :customer_id => customer.id,
      :payment_method_nonce => nonce
    )
    result = Braintree::Subscription.create(
      :payment_method_token => result.payment_method.token,
      :plan_id => "tablework-monthly"
    )
    result.subscription.id
  end

  def brainsuspend
  
  end

  def braincancel
    e = UserPayment.find(params[:id])
    result = Braintree::Subscription.cancel(e.payment_id)
    e.status = :Canceled
    e.save
    redirect_to user_payments_path, notice: 'Your subscription has been canceled'
  end
end
