class UserMailer < ActionMailer::Base
	default from: "support@gotoclassroom.com"
	layout "mailer"

	def sendemail_information(params, email)
		@params = params
		subject = "Login information to manage your " + @params.domain + "." + @params.domain_type
		mail(to: email, subject: subject)
	end
end
