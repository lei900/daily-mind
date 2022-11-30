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
FactoryBot.define do
  factory :thought_analysis do
    negative_thought { "MyText" }
    new_thought { "MyText" }
  end
end
