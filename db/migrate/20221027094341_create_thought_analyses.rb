class CreateThoughtAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :thought_analyses do |t|
      t.text :negative_thought
      t.text :new_thought

      t.timestamps
    end
  end
end
