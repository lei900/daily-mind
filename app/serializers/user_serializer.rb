class UserSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  has_many :entries, dependent: :destroy

  attributes :avatar, :nickname, :bio, :role, :uid
end
