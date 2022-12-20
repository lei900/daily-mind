class AddParticipantsNumberToExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :participants_number, :integer, default: 0
  end
end
