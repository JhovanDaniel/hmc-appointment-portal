class AddLocationIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :location_id, :int
  end
end
