# == Schema Information
#
# Table name: thought_analyses
#
#  id               :bigint           not null, primary key
#  negative_thought :text
#  new_thought      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class ThoughtAnalysis < ApplicationRecord
  has_one :entry, as: :entryable, touch: true, dependent: :destroy
  has_many :analysis_distortions
  has_many :distortions, through: :analysis_distortions
end
