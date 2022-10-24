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
require 'rails_helper'

RSpec.describe Exercise, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
