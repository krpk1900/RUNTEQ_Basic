class ChangeFirstNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :first_name, false
  end
end
