# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  nickname   :string           not null
#  role       :integer          default("general"), not null
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_uid  (uid) UNIQUE
#
class UserSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  has_many :entries, dependent: :destroy

  attributes :avatar, :nickname, :bio, :role, :uid
end
