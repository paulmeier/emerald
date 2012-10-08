# Use this file to easily define all of your cron jobs.
#
# After editing use "bundle exec whenever" to see cron output
# Use sudo whenever --update-crontab
# 
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# Learn more: http://github.com/javan/whenever
#set :output, '/home/e1031991/whenever.log'

every 1.day do  
  #Check the status of the code.
  command "rspec /home/e1031991/emerald/spec/** --format h > /home/e1031991/emerald/app/views/static_pages/rspec_output.html", environment: "development"
  command "chmod 777 /home/e1031991/emerald/app/views/static_pages/rspec_output.html", environment: "development"
  command "sed -i '265i<br><br><br><br>' /home/e1031991/emerald/app/views/static_pages/rspec_output.html", environment: "development"  
  
  #Do validations on saved configuration data  
  #Make sure the weights are not less than 99 and not more than 100. If so send out a notification.
  runner "LparConfig.verifyWeights", environment: "development"
  runner "LparConfig.verifyStorage", environment: "development"
  
  #Verify all machines have configurations
  runner "Machine.verifyMachineConfigsExist", environment: "development"
  
  #Parse any CSV files that may have been uploaded to /home/ftp/
  runner "Cpu.parseCSV('CPU#PA MIPS.csv')", environment: "development"
  runner "Cpu.parseCSV('CPU#PB MIPS.csv')", environment: "development" 
end

every 1.week do 
  #Build the API documentation
  command "rake doc:app", environment: "development"  
end
