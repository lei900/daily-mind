# == Schema Information
#
# Table name: entry_distortions
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  distortion_id :bigint           not null
#  entry_id      :bigint           not null
#
# Indexes
#
#  index_entry_distortions_on_distortion_id  (distortion_id)
#  index_entry_distortions_on_entry_id       (entry_id)
#
# Foreign Keys
#
#  fk_rails_...  (distortion_id => distortions.id)
#  fk_rails_...  (entry_id => entries.id)
#
FactoryBot.define do
  factory :entry_distortion do
    distortion { nil }
    thought_analysis { nil }
  end
end
