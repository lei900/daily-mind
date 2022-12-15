class CommunitySerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  has_many :community_entries, dependent: :destroy
  has_many :entries, through: :community_entries

  attributes :name, :introduction, :thumbnail
end
