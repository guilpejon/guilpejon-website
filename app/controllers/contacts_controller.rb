class ContactsController < ApplicationController
  def send_email
    if verify_recaptcha(action: 'contact', minimum_score: 0.5)
      ContactMailer.with(
        name: params[:name],
        email: params[:email],
        subject: params[:subject],
        message: params[:message],
      ).contact_email.deliver_later
      flash.now[:error] = nil
      redirect_to root_path, notice: 'Message sent successfully!'
    else
      flash.now[:error] = 'Cannot send message.'
      redirect_to root_path
    end
  end
end
