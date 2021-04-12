class ThanksMailer < ApplicationMailer
	default from: 'notifications@example.com'
		
	def welcome_email
		@name = params[:name]
		email = params[:email]
		mail(to: email, subject: '登録ありがとうございます！')
	end
end
