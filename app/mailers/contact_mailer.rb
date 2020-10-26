class ContactMailer < ApplicationMailer
  def contact_email
    @message = params[:message]
    @name = params[:name]
    mail(
      to: Rails.application.credentials.dig(:personal_email),
      subject: "[GuilPejon] #{params[:subject]}",
      reply_to: params[:email]
    )
  end
end
