every 3.minute do
  User.all.pluck(:email).each do |email|
    #runner DailyMailer.with(email: email).daily_email.deliver_later
    runner "DailyMailer.daily_email(#{email}}).deliver_later"
  end
end