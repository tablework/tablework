require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe 'welcome_note' do
    let(:user) { create :user }
    let!(:mail) { UserMailer.welcome_note(user) }

    it 'renders the subject' do
      expect(mail.subject).to eql("Welcome to tablework.")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['team@tablework.com'])
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("guardians")
    end

    it 'should change #count by 1' do
      expect{mail.deliver_now}.to change(ActionMailer::Base.deliveries, :count).by(1) 
    end
  end
end
