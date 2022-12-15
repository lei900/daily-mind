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
#  entryable_id   :integer
#  user_id        :bigint           not null
#
# Indexes
#
#  index_entries_on_user_id   (user_id)
#  index_entries_on_user_uid  (user_uid)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class EntrySerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  has_one :community_entry
  has_one :community, through: :community_entry
  belongs_to :user
  belongs_to :diary
  belongs_to :thought_analysis

  attributes :entyable_type, :entyable_id, :user_uid, :status
end
