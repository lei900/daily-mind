# == Schema Information
#
# Table name: exercises
#
#  id                   :bigint           not null, primary key
#  title                :string
#  short_description    :string
#  detailed_description :text
#  image                :string
#  conclusion           :text
#  slug                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Exercise < ApplicationRecord
  has_rich_text :detailed_description
  has_rich_text :conclusion
  has_many :questions

  # Set prettier urls, like "/exercises/1-separate-situation-and-thought"
  def to_param
    return nil unless persisted?
    [id, slug].join("-") # 1-separate-situation-and-thought
  end
end
