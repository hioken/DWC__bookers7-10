class ThanksMailer < ApplicationMailer
	default from: 'rubyonrailsmuzukashii@gmail.com'
		
	def welcome_email
		@name = params[:name]
		email = params[:email]
		mail(to: email, subject: '登録ありがとうございます！') do |format|
			format.text
		end
	end
end
