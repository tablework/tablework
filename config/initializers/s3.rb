# config/initializers/s3.rb
AWS.config(
  :access_key_id => ENV.fetch('AWS_ACCESS_KEY_ID'),
  :secret_access_key => ENV.fetch('AWS_ACCESS_KEY_SECRET')

)
