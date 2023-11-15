class ContactController < ApplicationController
  def send_cv
    CvMailer.send_cv(params[:email]).deliver_now
    redirect_to root_path, notice: 'CV enviado con éxito.'
  end
end
