# This class makes the photos hosted on AWS available.
class ApplicationController < ActionController::Base
    before_action :set_photo_keys
    before_action :get_photo_urls
  
    protected
  
    def set_photo_keys
      @photo_keys = [
        'bootstrap.svg', 'github.svg', 'rails.svg', 'js.svg',
        'linkedin.svg', 'postgresql.svg', 'fotoPaolo.jpg', 'conversation.svg',
        'git.svg', 'aws.svg', 'vercel.svg', 'githubWhite.svg'
      ]
    end
  
    def get_photo_urls
      s3 = Aws::S3::Resource.new(
        region: 'us-east-2',
        access_key_id: Rails.application.credentials.aws[:access_key_id],
        secret_access_key: Rails.application.credentials.aws[:secret_access_key]
      )
  
      @photo_keys.each do |photo_key|
        object = s3.bucket('paolosportfolio').object(photo_key)
        url = object.presigned_url(:get, expires_in: 3600)
        photo_name = File.basename(photo_key, File.extname(photo_key))
        instance_variable_set("@#{photo_name}", url)
      end
    rescue Aws::Errors::ServiceError => e
      Rails.logger.error "Couldn't get photo URLs. Here's why: #{e.message}"
    end
  end
  