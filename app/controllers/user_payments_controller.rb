class UserPaymentsController < ApplicationController
  extend Enumerize
  # skip_before_action :authenticate_user!
  # before_action :set_user_payment, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @user_payments = UserPayment.where(plantype: :Subscription)
    @pro_subscription = current_user.user_payments.last.try(:plantype) == "Subscription" && current_user.user_payments.last.try(:status) == "Live" 
    @superstar_subscription = current_user.user_payments.last.try(:plantype) == "Yearly" && current_user.user_payments.last.try(:status) == "Live" 

    respond_with(@user_payments)
  end

  private
    def set_user_payment
      @user_payment = UserPayment.find(params[:id])
    end

    def user_payment_params
      params.require(:user_payment).permit(:reference, :plantype)
    end
end
