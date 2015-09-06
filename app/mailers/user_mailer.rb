class UserMailer < ApplicationMailer

  default from: "team@tablework.com"

  def welcome_note user
    @user = user
    mail to: user.email, subject: "Welcome to tablework."
  end
end
