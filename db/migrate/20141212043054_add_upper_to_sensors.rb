class AddUpperToSensors < ActiveRecord::Migration
  def change
    add_column :sensors, :upper, :string
  end
end
