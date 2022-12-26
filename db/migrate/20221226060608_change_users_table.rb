class ChangeUsersTable < ActiveRecord::Migration[7.0]
  change_table :users do |t|
    t.rename :sub, :uid
    t.rename :profile_picture, :avatar
    t.remove :status, :username
    t.index :uid, unique: true
  end
end
