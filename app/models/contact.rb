class Contact < MailForm::Base
  attribute :name,:validate => true
  attribute :subject,:validate => true
  attribute :email,:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname, :captcha  => true

  def headers
    {
      :subject => "#{subject}",
      :to => Rails.application.credentials.dig(:personal_email),
      :from => Rails.application.credentials.dig(:personal_email),
      :reply_to => %("#{name}" <#{email}>)
    }
  end

  def deliver
    ContactMailer.with(message: "teste").contact_email.deliver_later
  end
end
