class CreatePinNumbers < ActiveRecord::Migration
  def change
    create_table :pin_numbers do |t|
      t.string :name
      t.references :transmitter, index: true
      t.references :sensor, index: true

      t.timestamps
    end
  end
end
