class EditUser1 < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :sub_id, :integer 
  end
end
