# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  bio             :string
#  nickname        :string           not null
#  profile_picture :string
#  role            :integer          default("general"), not null
#  status          :integer          default("active"), not null
#  sub             :string           not null
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username)
#
FactoryBot.define do
  factory :user do
    sub { "MySub" }
    nickname { "MyString" }
    bio { "MyText" }
    role { 0 }
    status { 0 }
    username { "MyString" }
    profile_picture { "MyString" }
  end
end
