class UserMailer < ActionMailer::Base
	default from: "support@gotoclassroom.com"
	layout "mailer"

	def sendemail_information(to_user)
		@to_user = to_user
		subject = "Congratulation, you are now in "
		mail(to: @to_user.user_hash.email, subject: subject)
	end
end
