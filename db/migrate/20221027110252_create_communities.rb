class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.string :name, null: false
      t.string :introduction
      t.string :thumbnail, null: false

      t.timestamps
    end
  end
end
