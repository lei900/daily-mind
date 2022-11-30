class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :title
      t.string :caption
      t.text :detailed_description
      t.string :image
      t.text :conclusion

      t.timestamps
    end
  end
end
