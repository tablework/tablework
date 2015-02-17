class UserPaymentsController < ApplicationController
  extend Enumerize
  # skip_before_action :authenticate_user!
  # before_action :set_user_payment, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @user_payments = UserPayment.where(plantype: :Subscription)
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
