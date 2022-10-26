# == Schema Information
#
# Table name: exercises
#
#  id                   :bigint           not null, primary key
#  title                :string
#  short_description    :string
#  detailed_description :text
#  image                :string
#  conclusion           :text
#  slug                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
FactoryBot.define do
  factory :exercise do
    sequence(:title) { |n| "MyExerciseTitle-#{n}" }
    short_description { "MyString" }
    detailed_description { "MyText" }
    image { "MyString" }
    conclusion { "MyText" }
    sequence(:slug) { |n| "exercise-#{n}" }
  end
end
