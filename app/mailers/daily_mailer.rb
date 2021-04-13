class DailyMailer < ApplicationMailer
  default from: ENV['FROM_MAIL']
  
  def self.daily_email(email)
    mail(to: email) { |format| format.text }
  end
end
