class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.integer :pin
      t.string :formula
      t.references :user, index: true
			t.references :transmitter, index: true

      t.timestamps
    end
		add_index :sensors, [:user_id, :transmitter_id]
  end
end
