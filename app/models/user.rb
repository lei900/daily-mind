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
class User < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_entries,
           through: :likes,
           source: :likeable,
           source_type: "Entry"
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_entries, through: :bookmarks, source: :entry
  has_many :comments, dependent: :destroy

  validates :uid, presence: true, uniqueness: true
  validates :role, presence: true
  validates :nickname, presence: true, length: { maximum: 32 }

  enum :role, { general: 0, admin: 1 }, default: :general

  def to_param
    uid
  end

  def self.find_or_create_user(user_info)
    user = User.find_by(uid: user_info[:uid])
    return user if user

    User.create!(uid: user_info[:uid], nickname: "User_#{uid[0, 4]}")
  end

  def bookmark(entry)
    bookmarked_entries << entry
  end

  def unbookmark(entry)
    bookmarked_entries.destroy(entry)
  end
end
