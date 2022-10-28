# == Schema Information
#
# Table name: exercises
#
#  id                   :bigint           not null, primary key
#  caption              :string
#  conclusion           :text
#  detailed_description :text
#  image                :string
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class ExerciseSerializer
  include JSONAPI::Serializer
  attributes :title, :caption, :detailed_description, :image, :conclusion
end
