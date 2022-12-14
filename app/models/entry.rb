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
  belongs_to :community
  belongs_to :user
  delegated_type :entryable, types: %w[Diary ThoughtAnalysis]
  accepts_nested_attributes_for :entryable

  enum :status, { draft: 0, published: 1, private: 2 }, prefix: true

  # entry.status_draft? # status == 'draft'
  # entry.status_published! # update(status: :published)
  # entry.status_private # User.where(status: :private)
end
