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
class User < ApplicationRecord
  has_many :entries, dependent: :destroy

  validates :uid, presence: true, uniqueness: true
  validates :role, presence: true

  enum :role, { general: 0, admin: 1 }, default: :general
end
