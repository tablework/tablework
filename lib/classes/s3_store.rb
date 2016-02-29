#  lib/s3_store.rb
class S3Store
  BUCKET = ENV.fetch('S3_BUCKET_NAME').freeze

  def initialize file, filename
    @file = file
    @filename = filename
    @s3 = AWS::S3.new
    @bucket = @s3.buckets[BUCKET]
  end

  def store
    @obj = @bucket.objects[@filename].write(@file, acl: :public_read)
    self
  end

  def url
    @obj.public_url.to_s
  end
end
