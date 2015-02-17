class UserPaymentsController < ApplicationController
  # skip_before_action :authenticate_user!
  # before_action :set_user_payment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def process_payment(nameoncard, cardnumber, nonce, plan, customer)
    Payment.brainprocess(nameoncard, cardnumber, nonce, plan, customer)
    redirect_to payments_path
  end

  def index
    @user_payments = UserPayment.all
    respond_with(@user_payments)
  end

  def new
    @client_token = Braintree::ClientToken.generate
    @user_payment = UserPayment.new
    respond_with(@user_payment) 
  end

  def payments
    @user_payment = UserPayment.new(user_payment_params)
    @user_payment.save
    nameoncard = params[:nameoncard]
    cardnumber = params[:cardnumber]
    nonce = params[:payment_method_nonce]
    plan = params[:plan]
    customer = brain_search.first || brain_customer 
    
    @user_payment.process_payment
    respond_with(@user_payment)
  end

  private
    def set_user_payment
      @user_payment = UserPayment.find(params[:id])
    end

    def user_payment_params
      params.require(:user_payment).permit(:reference, :plantype)
    end
end
