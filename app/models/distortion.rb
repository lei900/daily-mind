# == Schema Information
#
# Table name: distortions
#
#  id          :bigint           not null, primary key
#  definition  :string
#  description :text
#  icon        :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Distortion < ApplicationRecord
  has_many :analysis_distortions
  has_many :choice_distortions
end
