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
    title { "MyString" }
    short_description { "MyString" }
    detailed_description { "MyText" }
    image { "MyString" }
    conclusion { "MyText" }
    type { "" }
  end
end
