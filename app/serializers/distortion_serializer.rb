# == Schema Information
#
# Table name: distortions
#
#  id          :bigint           not null, primary key
#  definition  :string
#  description :text
#  name        :string
#  thumbnail   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class DistortionSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :name, :definition, :description, :thumbnail
end
