class RemovePinNumberFromSensors < ActiveRecord::Migration
  def change
    remove_column :sensors, :pin_number, :integer
  end
end
