class AddClockworkDatabaseEventToSensors < ActiveRecord::Migration
  def change
    add_reference :sensors, :clockwork_database_event, index: true
  end
end
