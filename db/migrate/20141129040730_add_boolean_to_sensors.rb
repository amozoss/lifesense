class AddBooleanToSensors < ActiveRecord::Migration
  def change
     add_column :sensors, :led, :boolean, default: false
  end
end
