class EditUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sub_id, :integer , null:false
  end
end
