class ExerciseSerializer
  include JSONAPI::Serializer
  attributes :title,
             :short_description,
             :detailed_description,
             :image,
             :conclusion,
             :slug
  # has_many :questions
end
