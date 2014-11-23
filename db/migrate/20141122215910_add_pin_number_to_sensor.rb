class AddPinNumberToSensor < ActiveRecord::Migration
  def change
    add_reference :sensors, :pin_number, index: true
  end
end
