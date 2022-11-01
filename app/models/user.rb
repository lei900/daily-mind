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
#  sub: Subject of the JWT (the user)
#  sub             :string           not null
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username)
#
class User < ApplicationRecord
  has_many :entries, dependent: :destroy

  enum :role, { general: 0, admin: 1 }, default: :general
  enum :status, { active: 0, deactivated: 1 }, default: :active

  # # token情報を参照し、現在のユーザーを取得
  # def self.from_token_payload(payload)
  #   find_by(sub: payload["sub"]) || create!(sub: payload["sub"])
  # end
end
