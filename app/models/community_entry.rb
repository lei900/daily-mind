# == Schema Information
#
# Table name: community_entries
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  community_id :bigint           not null
#  entry_id     :bigint           not null
#
# Indexes
#
#  index_community_entries_on_community_id               (community_id)
#  index_community_entries_on_community_id_and_entry_id  (community_id,entry_id) UNIQUE
#  index_community_entries_on_entry_id                   (entry_id)
#
# Foreign Keys
#
#  fk_rails_...  (community_id => communities.id)
#  fk_rails_...  (entry_id => entries.id)
#
class CommunityEntry < ApplicationRecord
  belongs_to :entry
  belongs_to :community

  validates :entry_id, uniqueness: { scope: :community_id }
end
