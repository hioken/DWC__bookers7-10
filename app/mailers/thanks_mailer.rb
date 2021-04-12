class ThanksMailer < ApplicationMailer
	default from: 'notifications@example.com'
		
	def welcome_email
		@user = current_user
		mail(to: @user.email, subject: '登録ありがとうございます！')
	end
end
