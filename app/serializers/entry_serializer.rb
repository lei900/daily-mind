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
class EntrySerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  attributes :entryable_type,
             :entryable_id,
             :status,
             :user,
             :diary,
             :community,
             :thought_analysis,
             :distortions,
             :created_at

  attribute :likes do |object|
    object.likes.count.to_s
  end

  attribute :entry_liker_uids do |object|
    object.entry_likers.pluck(:uid)
  end

  attribute :bookmarks do |object|
    object.bookmarks.count.to_s
  end

  attribute :bookmarker_uids do |object|
    object.bookmarkers.pluck(:uid)
  end

  attribute :comments do |object|
    CommentSerializer.new(
      object.comments.includes(:user).order(created_at: :desc),
    )
  end

  attribute :comment_count do |object|
    object.comments.count.to_s
  end

  # Modify it later when frontend is modified
  # attribute :thought_analysis do |object|
  #   object.thought_analysis.as_json.deep_transform_keys do |key|
  #     key.camelize(:lower)
  #   end
  # end
end
