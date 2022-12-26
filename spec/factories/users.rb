# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  nickname   :string           not null
#  role       :integer          default("general"), not null
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_uid  (uid) UNIQUE
#
FactoryBot.define do
  factory :user do
    uid { |n| "MyUid-#{n}" }
    role { 0 }
    avatar { "avatar" }
    bio { "user_bio" }
    nickname { "user_nickname" }
  end
end
