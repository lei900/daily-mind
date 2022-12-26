# == Schema Information
#
# Table name: communities
#
#  id           :bigint           not null, primary key
#  icon         :string           not null
#  introduction :string
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_communities_on_name  (name) UNIQUE
#
class Community < ApplicationRecord
  has_many :community_entries, dependent: :destroy
  has_many :entries, through: :community_entries

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true
end
