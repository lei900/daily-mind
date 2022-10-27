class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :bio
      t.integer :role, default: 0, null: false
      t.string :username
      t.string :profile_picture

      t.timestamps
    end
  end
end
