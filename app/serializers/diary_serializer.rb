# == Schema Information
#
# Table name: diaries
#
#  id         :bigint           not null, primary key
#  body       :text
#  mood       :integer          not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DiarySerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  # has_one :entry, serializer: :entry

  attributes :title, :body, :mood
end
