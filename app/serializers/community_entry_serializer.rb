class CommunityEntrySerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  belongs_to :entry
  belongs_to :community
  attributes :entry_id, :community_id
end
