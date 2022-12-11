# == Schema Information
#
# Table name: choice_distortions
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  choice_id     :bigint
#  distortion_id :bigint
#
# Indexes
#
#  index_choice_distortions_on_choice_id      (choice_id)
#  index_choice_distortions_on_distortion_id  (distortion_id)
#
class ChoiceDistortion < ApplicationRecord
  belongs_to :distortion
  belongs_to :choice
end
