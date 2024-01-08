class UserMailerController < ApplicationController
    #functionality as mediatory between the request for sending in ./contact_controller.rb and the form in ../views/contact/index.html.erb
  def send_cv
    email = params[:email] # gets email parameter from the form
    file_key = 'Paolo-Cordova.pdf' # Gets static name of the file

    if UserMailer.send_cv(email, file_key).deliver_now
      redirect_to contact_path , notice: 'CV enviado con éxito'
    else
      redirect_to contact_path , alert: 'Error al enviar el CV'
    end
  end

end