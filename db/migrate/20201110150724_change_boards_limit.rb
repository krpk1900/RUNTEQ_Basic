class ChangeBoardsLimit < ActiveRecord::Migration[5.2]
  def up
    change_column :boards, :title, :string, limit: 255
    change_column :boards, :body, :text, limit: 65535
  end

  def down
    change_column :boards, :title, :string
    change_column :boards, :body, :text
  end
end
