# NullStorage provider for CarrierWave for use in tests.  Doesn't actually
# upload or store files but allows test to pass as if files were stored and
# the use of fixtures.
class NullStorage
 attr_reader :uploader

 def initialize(uploader)
   @uploader = uploader
 end

 def identifier
   uploader.filename
 end

 def store!(_file)
   true
 end

 def retrieve!(_identifier)
   true
 end
end


#CarrierWave AWS configuration
CarrierWave.configure do |config|
 config.cache_dir = "#{Rails.root}/tmp/uploads"
 if Rails.env.production? || Rails.env.development?
   config.storage    = :aws
   config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
   config.aws_acl    = :public_read
   # config.asset_host = 'http://example.com'
   config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

   config.aws_credentials = {
     access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
     secret_access_key: ENV.fetch('AWS_ACCESS_KEY_SECRET')
   }
 elsif Rails.env.test?
   config.storage NullStorage
   config.enable_processing = false
 end
end