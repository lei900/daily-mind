class RemoveDistortionNameColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :choices, :distortion_name, :string
  end
end
