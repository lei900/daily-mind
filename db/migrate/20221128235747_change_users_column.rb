class ChangeUsersColumn < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :uid
    remove_column :users, :nickname, :string
    remove_column :users, :bio, :string
    remove_column :users, :status, :integer
    remove_column :users, :username, :string
    remove_column :users, :profile_picture, :string
  end
end
