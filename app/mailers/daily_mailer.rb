class DailyMailer < ApplicationMailer
  default from: ENV['FROM_MAIL']
  
  def daily_email
    mail(to: params[:email]) { |format| format.text }
  end
end
