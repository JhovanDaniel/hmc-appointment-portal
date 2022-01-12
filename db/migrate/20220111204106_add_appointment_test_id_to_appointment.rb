class AddAppointmentTestIdToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :appointment_test_id, :int
  end
end
