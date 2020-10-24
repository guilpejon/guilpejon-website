class ContactMailer < ApplicationMailer
  def contact_email
    @message = params[:message]
    mail(
      to: Rails.application.credentials.dig(:personal_email),
      subject: 'Thanks for signing up for our amazing app',
      reply_to: params[:email]
    )
  end
end
