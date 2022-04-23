class AddNickNameToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :nick_name, :string
  end
end
