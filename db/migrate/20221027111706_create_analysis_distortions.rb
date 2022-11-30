class CreateAnalysisDistortions < ActiveRecord::Migration[7.0]
  def change
    create_table :analysis_distortions do |t|
      t.references :distortion, null: false, foreign_key: true
      t.references :thought_analysis, null: false, foreign_key: true

      t.timestamps
    end
  end
end
