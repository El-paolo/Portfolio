class HomeController < ApplicationController
  
  def index
    
    def get_object_url(bucket_name, object_key)
      s3 = Aws::S3::Resource.new(
        region: 'us-east-2',
        access_key_id: Rails.application.credentials.aws[:access_key_id],
        secret_access_key: Rails.application.credentials.aws[:secret_access_key]
      )
      object = s3.bucket(bucket_name).object(object_key)
      url = object.presigned_url(:get, expires_in: 3600)
      url
    rescue Aws::Errors::ServiceError => e
      puts "Couldn't get object URL. Here's why: #{e.message}"
    end
    
    bucket_name = 'paolosportfolio'
    object_key = '20230824_141523.jpg'

    @url = get_object_url(bucket_name, object_key)
    puts @url if @url
    
    
  end
end
