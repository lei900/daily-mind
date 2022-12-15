# == Schema Information
#
# Table name: communities
#
#  id           :bigint           not null, primary key
#  introduction :string
#  name         :string           not null
#  thumbnail    :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Community < ApplicationRecord
  has_many :community_entries, dependent: :destroy
  has_many :entries, through: :community_entries

  validates :name, presence: true, uniqueness: true
  validates :thumbnail, presence: true
end
