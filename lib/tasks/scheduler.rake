desc "This task is called by the Heroku scheduler add-on"
task :calculate_results_per_day => :environment do
  puts "Starting task calculate_results_per_day..."
  Score.calculate_results_per_day
  puts "done."
end

task :prepare_mail => :environment do
  puts "Starting task prepare_mail..."
  User.prepare_mail
  puts "done."
end