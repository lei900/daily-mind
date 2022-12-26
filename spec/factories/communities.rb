# == Schema Information
#
# Table name: communities
#
#  id           :bigint           not null, primary key
#  icon         :string           not null
#  introduction :string
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_communities_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :community do
    name { |n| "MyName-#{n}" }
    introduction { "MyString" }
    icon { "MyString" }
  end
end
