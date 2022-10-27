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
class User < ApplicationRecord
  has_many :entries, dependent: :destroy

  enum :role, { general: 0, admin: 1 }, default: :general
end
