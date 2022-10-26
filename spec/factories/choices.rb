# == Schema Information
#
# Table name: choices
#
#  id                :bigint           not null, primary key
#  content           :string
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
FactoryBot.define do
  factory :choice do
    question { nil }
    content { "MyString" }
    is_correct_choice { false }
  end
end
