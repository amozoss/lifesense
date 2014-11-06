class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :time_stamp
      t.float :value
      t.references :sensor, index: true

      t.timestamps
    end
		add_index :records, [:sensor_id, :time_stamp]
  end
end
