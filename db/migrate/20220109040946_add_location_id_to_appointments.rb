class AddLocationIdToAppointments < ActiveRecord::Migration[6.1]
  def change
    def change
      add_column :appointments, :location_id, :int
    end
  end
end
