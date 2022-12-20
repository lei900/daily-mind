# == Schema Information
#
# Table name: exercises
#
#  id                   :bigint           not null, primary key
#  caption              :string
#  conclusion           :text
#  detailed_description :text
#  image                :string
#  participants_number  :integer          default(0)
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class ExerciseSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :title,
             :caption,
             :detailed_description,
             :image,
             :conclusion,
             :participants_number
end
