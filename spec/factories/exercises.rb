# == Schema Information
#
# Table name: exercises
#
#  id                   :bigint           not null, primary key
#  caption              :string
#  conclusion           :text
#  detailed_description :text
#  image                :string
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
FactoryBot.define do
  factory :exercise do
    sequence(:title) { |n| "MyExerciseTitle-#{n}" }
    caption { "MyString" }
    detailed_description { "MyText" }
    image { "MyString" }
    conclusion { "MyText" }
  end
end
