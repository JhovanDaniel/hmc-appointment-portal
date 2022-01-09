class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      
      t.string :name
      t.string :location
      t.string :email
      
      t.timestamps
    end
  end
end
