class ContactsController < ApplicationController
  def send_email
    if verify_recaptcha(action: 'contact', minimum_score: 0.5)
      ContactMailer.with(
        name: params[:name],
        email: params[:email],
        subject: params[:subject],
        message: params[:message],
      ).contact_email.deliver_later if Rails.env.production?
      flash[:success] = 'Message sent successfully!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to send the message.'
      redirect_to root_path
    end
  end
end
