class CreateTransmitters < ActiveRecord::Migration
  def change
    create_table :transmitters do |t|
      t.string :name
      t.string :transmitter_token
      t.references :user, index: true

      t.timestamps
    end
    add_index :transmitters, [:user_id, :transmitter_token]
  end
end
