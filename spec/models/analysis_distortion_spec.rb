# == Schema Information
#
# Table name: analysis_distortions
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  distortion_id       :bigint           not null
#  thought_analysis_id :bigint           not null
#
# Indexes
#
#  index_analysis_distortions_on_distortion_id        (distortion_id)
#  index_analysis_distortions_on_thought_analysis_id  (thought_analysis_id)
#
# Foreign Keys
#
#  fk_rails_...  (distortion_id => distortions.id)
#  fk_rails_...  (thought_analysis_id => thought_analyses.id)
#
require 'rails_helper'

RSpec.describe AnalysisDistortion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
