class AddUidToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :user_uid, :string
    add_index :entries, :user_uid
  end
end
