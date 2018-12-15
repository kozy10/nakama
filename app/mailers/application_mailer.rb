class ApplicationMailer < ActionMailer::Base
  default from: '"nakama" <noreply@example.com>'
  				reply_to: 'noreply@example.com'
  layout 'mailer'
end
