# == Schema Information
#
# Table name: distortions
#
#  id          :bigint           not null, primary key
#  definition  :string
#  description :text
#  name        :string
#  thumbnail   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :distortion do
    name { "MyString" }
    definition { "MyString" }
    description { "MyText" }
    thumbnail { "MyString" }
  end
end
