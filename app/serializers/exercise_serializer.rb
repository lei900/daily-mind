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
  attributes :title,
             :short_description,
             :detailed_description,
             :image,
             :conclusion,
             :slug
end
