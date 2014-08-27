class UserMailer < ActionMailer::Base
	default from: "support@gotoclassroom.com"
	layout "mailer"

	def sendemail_information(params, email)
		@params = params
		subject = "Set up more information"
		mail(to: email, subject: subject)
	end
end
