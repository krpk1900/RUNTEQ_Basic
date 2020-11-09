class ChangeNameLimit255 < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :first_name, :string, limit: 255
    change_column :users, :last_name, :string, limit: 255
  end
end
