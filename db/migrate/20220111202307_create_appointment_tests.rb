class CreateAppointmentTests < ActiveRecord::Migration[6.1]
  def change
    create_table :appointment_tests do |t|
  
      t.string :laboratory_number
      t.string :speciment_number
      t.string :control_number
      t.date :result_date
      t.string :result
      t.boolean :approval_status

      t.timestamps
    end
  end
end
