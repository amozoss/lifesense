require 'clockwork'
require 'curb'
require 'clockwork/database_events'
require_relative '../config/boot'
require_relative '../config/environment'

module Clockwork
  Clockwork.manager = DatabaseEvents::Manager.new

  sync_database_events model: ClockworkDatabaseEvent, every: 1.minute do |model_instance|
    #redis.send_message_to_node
    puts "running #{model_instance}"
    model_instance.do_some_work

    #YourSidekiqWorkerClass.perform_async
  end

  #handler do |job|
    #puts "Queueing job: #{job}"
    #c = Curl::Easy.perform("http://www.google.com")
    #puts c.body_str
  #end

  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end

  #every(10.seconds, 'frequent.job')
  #every(3.minutes, 'less.frequent.job')
  #every(1.hour, 'hourly.job')
  #every(1.day, 'midnight.job', :at => '00:00')
end
