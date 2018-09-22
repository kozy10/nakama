class NotificationMailer < ApplicationMailer
	def send_when_message(user, other, message)
		@user = user
		@other = other
		@message = message
		mail(
			to: @other.email,
			subject: 'メッセージを受け取りました'
		)
  end
end
