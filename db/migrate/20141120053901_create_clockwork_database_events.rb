class CreateClockworkDatabaseEvents < ActiveRecord::Migration
  def change
    create_table :clockwork_database_events do |t|
      t.integer :frequency_quantity
      t.references :frequency_period
      t.string :at

      t.timestamps
    end
     add_index :clockwork_database_events, :frequency_period_id
  end
end
