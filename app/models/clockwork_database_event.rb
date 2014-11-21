class ClockworkDatabaseEvent < ActiveRecord::Base
  belongs_to :frequency_period

  # Used by clockwork to schedule how frequently this event should be run
  # Should be the intended number of seconds between executions
  def frequency
    frequency_quantity.send(frequency_period.name.pluralize)
  end

  def at
    return nil
  end

  def do_some_work
    c = Curl::Easy.perform("http://energia.nu/hello.html")
    c.perform
    puts c.body_str
  end
end
