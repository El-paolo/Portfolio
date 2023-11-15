class UserMailer < ApplicationMailer
    #function gets aws request
    def send_cv(email, file_key)
        s3 = Aws::S3::Resource.new(
            region: 'us-east-2',
            access_key_id: Rails.application.credentials.aws[:access_key_id],
            secret_access_key: Rails.application.credentials.aws[:secret_access_key]
    )
        obj = s3.bucket('paolosportfolio').object(file_key)
        if obj.exists?
          cv_content = obj.get.body.read
          attachments['CV.pdf'] = { mime_type: 'application/pdf', content: cv_content }
          mail(to: email, subject: 'Paolo Cordova CV Dev')
        else
            redirect_to contact_path , alert: 'Bad request, something went wrong' # if something goes wrong
        end
    end
end
