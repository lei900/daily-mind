class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :sub, null: false
      t.string :nickname, null: false
      t.string :bio
      t.integer :role, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.string :username, unique: true, index: true
      t.string :profile_picture

      t.timestamps
    end
  end
end
