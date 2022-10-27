# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  bio             :string
#  name            :string           not null
#  profile_picture :string
#  role            :integer          default("general"), not null
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    name { "MyString" }
    bio { "MyText" }
    role { "MyString" }
    integer { "MyString" }
    username { "MyString" }
    string { "MyString" }
    profile_picture { "MyString" }
    string { "MyString" }
  end
end
