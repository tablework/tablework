class UserMailer < ApplicationMailer

  default from: "team@tablework.com"

  def welcome_note user
    @user = user
    mail to: user.email, subject: "Welcome to tablework."
  end

  def yearly_subscription user
    @user = user
    mail to: user.email, subject: 'YEARLY'
  end

  def monthly_subscription user
    @user = user
    mail to: user.email, subject: 'MONTHLY'
  end
  
end
