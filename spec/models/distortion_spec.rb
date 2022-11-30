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
require 'rails_helper'

RSpec.describe Distortion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
