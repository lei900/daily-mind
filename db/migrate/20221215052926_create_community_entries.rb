class CreateCommunityEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :community_entries do |t|
      t.references :community, null: false, foreign_key: true
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
    add_index :community_entries, %i[community_id entry_id], unique: true
  end
end
