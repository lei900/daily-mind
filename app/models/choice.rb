# == Schema Information
#
# Table name: choices
#
#  id                :bigint           not null, primary key
#  content           :string
#  distortion_name   :string
#  is_correct_choice :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  question_id       :bigint           not null
#
# Indexes
#
#  index_choices_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
class Choice < ApplicationRecord
  belongs_to :question
  has_one :choice_distortion
  has_one :distortion, through: :choice_distortion
  validates :content, presence: true
end
