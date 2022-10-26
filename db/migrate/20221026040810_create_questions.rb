class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.text :result_interpretation
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
