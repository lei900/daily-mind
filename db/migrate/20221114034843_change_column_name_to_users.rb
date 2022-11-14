class ChangeColumnNameToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :sub, :uid
  end
end
