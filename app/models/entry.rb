# == Schema Information
#
# Table name: entries
#
#  id            :bigint           not null, primary key
#  entyable_type :string
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  community_id  :bigint
#  entryable_id  :integer
#  user_id       :bigint           not null
#
# Indexes
#
#  index_entries_on_community_id  (community_id)
#  index_entries_on_user_id       (user_id)
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

  enum :status, { draft: 0, published: 1, private: 2 }

  # params = { note: { authorable_type: 'Employee', body: "sample text", authorable_attributes: { name: 'Emp one' } } }
  # note = Note.create!(params[:note])

  # user.status_pending? # status == 'pending'
  # user.status_active! # update(status: :active)
  # User.status_archived # User.where(status: :archived)
end
