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
class QuestionSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :qid, :body, :result_interpretation

  attribute :choices do |object|
    object.choices.map do |choice|
      choice.as_json.deep_transform_keys { |key| key.camelize(:lower) }
    end
  end
end
