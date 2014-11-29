class AddLowerToSensors < ActiveRecord::Migration
  def change
    add_column :sensors, :lower, :string
  end
end
