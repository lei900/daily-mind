# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  nickname   :string
#  role       :integer          default("general"), not null
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_uid  (uid) UNIQUE
#
class User < ApplicationRecord
  has_many :entries, dependent: :destroy

  validates :uid, presence: true, uniqueness: true
  validates :role, presence: true

  enum :role, { general: 0, admin: 1 }, default: :general

  def self.find_or_create_user(user_info)
    user = User.find_by(uid: user_info[:uid])
    return user if user

    User.create!(
      uid: user_info[:uid],
      nickname: user_info[:nickname],
      avatar: user_info[:avatar],
    )
  end
end
