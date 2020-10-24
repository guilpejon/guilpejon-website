class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:personal_email)
  layout 'mailer'
end
