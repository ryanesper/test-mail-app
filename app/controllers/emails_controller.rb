class EmailsController < ApplicationController
	def index

	end

	def send_mail
		dateToSend = params[:emails][:datetime]
		delay = Time.parse(dateToSend).to_i - Time.now.to_i
		TestMailer.with(sendTo: params[:emails][:email]).welcome_email.deliver_later(wait_until: delay.seconds.from_now)
		flash[:notify] = 'Email Sent.'
		redirect_to root_path
	end
end
