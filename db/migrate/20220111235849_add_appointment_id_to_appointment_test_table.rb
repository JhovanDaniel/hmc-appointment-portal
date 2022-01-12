class AddAppointmentIdToAppointmentTestTable < ActiveRecord::Migration[6.1]
  def change
    add_column :appointment_tests, :appointment_id, :int
  end
end
