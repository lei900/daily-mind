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
class Distortion < ApplicationRecord
  has_many :analysis_distortions
end
