# == Schema Information
#
# Table name: entries
#
#  id             :bigint           not null, primary key
#  entryable_type :string
#  status         :integer
#  user_uid       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  community_id   :bigint
#  entryable_id   :integer
#  user_id        :bigint           not null
#
# Indexes
#
#  index_entries_on_community_id  (community_id)
#  index_entries_on_user_id       (user_id)
#  index_entries_on_user_uid      (user_uid)
#
# Foreign Keys
#
#  fk_rails_...  (community_id => communities.id)
#  fk_rails_...  (user_id => users.id)
#
class Entry < ApplicationRecord
  has_one :community_entry, dependent: :destroy
  has_one :community, through: :community_entry
  has_many :entry_distortions, dependent: :destroy
  has_many :distortions, through: :entry_distortions
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :entry_likers, through: :likes, source: :user
  belongs_to :user
  delegated_type :entryable, types: %w[Diary ThoughtAnalysis]
  accepts_nested_attributes_for :entryable

  # Use prefix to avoid confict with perserved keyword "private"
  # entry.status_draft? # status == 'draft'
  # entry.status_published! # update(status: :published)
  # entry.status_private # User.where(status: :private)
  enum :status, { draft: 0, published: 1, private: 2 }, prefix: true

  def create_community_entry(community_id)
    self.community = Community.find(community_id) if community_id
  end

  def create_distortions(distortion_ids)
    self.distortions =
      distortion_ids.map { |id| Distortion.find(id) } if distortion_ids
  end
end
