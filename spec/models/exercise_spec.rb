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
require 'rails_helper'

RSpec.describe Exercise, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
