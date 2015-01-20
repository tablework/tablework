module Features
  module SessionHelpers
    require 'spec_helper'


    def mock_oauth user
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {"provider"=> user.authorizations.first.provider,
       "uid"=>user.uid,
       "credentials"=>
        {
          "token"=>user.authorizations.first.token
        },
       "info"=>
        {
         "email"=>user.email,
         "urls"=>{"Facebook"=>"https://www.facebook.com/jack"},
         "verified"=>true},

       "extra"=>
        {"raw_info"=>
          {"id"=>"324234234",

           "gender"=>"male",
           "email"=> user.email ,
           "timezone"=>8,
           "locale"=>"en_US",
           "verified"=>true,
           "updated_time"=>"2014-02-27T15:58:44+0000",
           "username"=>"jack"}}}
     )
    end

    def invalid_mock_oauth user
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    end

    def sign_in user
      mock_oauth(user)
      visit '/'
      click_link 'Sign in with Facebook'
    end

    def invalid_sign_in user
      invalid_mock_oauth(user)
      p page
      visit '/'
      click_link 'Sign in with Facebook'
    end

  end
end