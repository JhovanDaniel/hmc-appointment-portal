class AddReceptionDateToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :appointment_tests, :reception_date, :date
  end
end
