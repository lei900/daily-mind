class AddDistortionsToChoices < ActiveRecord::Migration[7.0]
  def change
    add_column :choices, :distortion_name, :string
  end
end
