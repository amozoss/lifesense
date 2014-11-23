class RemoveTransmitterRefFromSensors < ActiveRecord::Migration
  def change
    remove_column :sensors, :transmitter_id, :integer
  end
end
