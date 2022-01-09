class AddLocationIdToAppointments2 < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :location_id, :int
  end
end
