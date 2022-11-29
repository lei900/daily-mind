# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
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
    uid { "MyUid" }
    role { 0 }
  end
end
