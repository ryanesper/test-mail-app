class EmailsController < ApplicationController
	def index

	end

	def send_mail

		@mail = params[:mail] 
		delay = Time.parse(@mail[:datetime]).to_i - Time.now.to_i

		TestMailer.with(
			email: @mail[:email], 
			subject: @mail[:subject],
			message: @mail[:message],
		)
		.welcome_email
		.deliver_later(wait_until: delay.seconds.from_now)

		flash[:notify] = 'Email Sent.'
		redirect_to root_path
	end
end
