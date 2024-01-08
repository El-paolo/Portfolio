class ContactController < ApplicationController
  #functionality for the form in ../views/contact/index.hmtl.erb
  #binded with the mailer for the cv sent
  def send_cv
    CvMailer.send_cv(params[:email]).deliver_now
    redirect_to root_path, notice: 'CV enviado con éxito.'
  end
end
