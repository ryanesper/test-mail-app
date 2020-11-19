class EmailsController < ApplicationController

	def index

	end

	def send_mail
		pp = params.require(:mail).permit(:email, :subject, :message, :datetime)
		pp[:email] = extractEmails << pp[:email]

		delay = Time.parse(pp[:datetime]).to_i - Time.now.to_i

		TestMailer.with(pp)
		.welcome_email
		.deliver_later(wait_until: delay.seconds.from_now)

		flash[:notify] = 'Email Sent.'
		redirect_to root_path
	end

	# email must be in the first column or index zero in the excel file
	def extractEmails
		xlsx = Roo::Spreadsheet.open(params[:mail][:excelData])
		emails = []

		xlsx.each_with_index do |v, k|
		  next if k == 0
		  emails << v[0]
		end

		emails
	end
end
