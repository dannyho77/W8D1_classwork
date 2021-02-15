class EditUser2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sub_id
    add_column :users, :sub_id, :integer
  end
end
