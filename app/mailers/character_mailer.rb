class CharacterMailer < ApplicationMailer
  default from: "team@tablework.com"

  def share_pdf character, email 
    @character = character
    mail to: email, subject: "PDF for character name: #{character.name}"
  end
end
