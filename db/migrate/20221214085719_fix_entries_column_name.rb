class FixEntriesColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :entries, :entyable_type, :entryable_type
  end
end
