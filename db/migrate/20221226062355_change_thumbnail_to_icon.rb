class ChangeThumbnailToIcon < ActiveRecord::Migration[7.0]
  def change
    rename_column :communities, :thumbnail, :icon
    rename_column :distortions, :thumbnail, :icon
  end
end
