class TestMailer < ApplicationMailer

	def welcome_email
		@message = params[:message]
		mail(
			to: params[:email],
			subject: params[:subject],
		)
	end
end
