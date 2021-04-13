class DailyMailer < ApplicationMailer
  default from: 'notifications@example.com'
  
  def daily_email
    mail(to: params[:email])
  end
end
