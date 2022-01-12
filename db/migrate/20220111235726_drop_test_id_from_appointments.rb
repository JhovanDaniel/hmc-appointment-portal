class DropTestIdFromAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :appointment_test_id
  end
end
