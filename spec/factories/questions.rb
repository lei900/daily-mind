# == Schema Information
#
# Table name: questions
#
#  id                    :bigint           not null, primary key
#  body                  :text
#  qid                   :integer
#  result_interpretation :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  exercise_id           :bigint           not null
#
# Indexes
#
#  index_questions_on_exercise_id  (exercise_id)
#
# Foreign Keys
#
#  fk_rails_...  (exercise_id => exercises.id)
#
FactoryBot.define do
  factory :question do
    exercise
    sequence(:body) { |n| "MyQuestion-#{n}" }
    sequence(:qid) { |n| n + 1 }
    sequence(:result_interpretation) { |n| "MyResult-#{n}" }

    after :create do |question|
      create_list :choice, 4, question: question
    end
  end
end
