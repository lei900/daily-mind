class AddIndexNameToCommunities < ActiveRecord::Migration[7.0]
  def change
    add_index :communities, :name, unique: true
  end
end
