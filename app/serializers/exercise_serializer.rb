# == Schema Information
#
# Table name: exercises
#
#  id                   :bigint           not null, primary key
#  conclusion           :text
#  detailed_description :text
#  image                :string
#  short_description    :string
#  slug                 :string
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
