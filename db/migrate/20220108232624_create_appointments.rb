class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|

      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.string :phone
      t.string :email
      t.datetime :appointment_time
      

      t.timestamps
    end
  end
end