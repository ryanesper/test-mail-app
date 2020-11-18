class TestMailer < ApplicationMailer

	def welcome_email
		mail(to: params[:sendTo], subject: 'Test Email')
	end
end
