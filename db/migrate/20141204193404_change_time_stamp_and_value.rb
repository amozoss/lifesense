class ChangeTimeStampAndValue < ActiveRecord::Migration
  def change
    rename_column :records, :time_stamp, :x
    rename_column :records, :value, :y
  end
end
