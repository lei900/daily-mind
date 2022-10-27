class CreateDistortions < ActiveRecord::Migration[7.0]
  def change
    create_table :distortions do |t|
      t.string :name
      t.string :definition
      t.text :description
      t.string :thumbnail

      t.timestamps
    end
  end
end
