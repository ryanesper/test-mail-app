class EmailsController < ApplicationController
	def index

	end

	def send_mail
		TestMailer.with(sendTo: params[:emails][:email]).welcome_email.deliver_now
		flash[:notify] = 'Email Sent.'
		redirect_to root_path
	end
end
