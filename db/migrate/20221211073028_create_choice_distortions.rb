class CreateChoiceDistortions < ActiveRecord::Migration[7.0]
  def change
    create_table :choice_distortions do |t|
      t.references :choice
      t.references :distortion
      t.timestamps
    end
  end
end
