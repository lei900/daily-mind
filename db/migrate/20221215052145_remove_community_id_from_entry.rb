class RemoveCommunityIdFromEntry < ActiveRecord::Migration[7.0]
  def change
    remove_index :entries, name: "index_entries_on_community_id"
    remove_foreign_key :entries, column: :community_id
    remove_column :entries, :community_id, :bigint
  end
end
