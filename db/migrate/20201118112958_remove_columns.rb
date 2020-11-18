class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :end_time
  end
end
