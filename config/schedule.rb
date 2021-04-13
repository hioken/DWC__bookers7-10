# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/home/ec2-user/environment/DWC__bookers7-10/log/cron_log.log"
set :environment, :development
#
every 1.minutes do
  runner "User.daily_email_sent"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
