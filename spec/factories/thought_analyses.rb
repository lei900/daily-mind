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

    trait :published do
      after(:create) do |thought_analysis|
        create(:entry, entryable: thought_analysis, status: :published)
      end
    end

    trait :private do
      after(:create) do |thought_analysis|
        create(:entry, entryable: thought_analysis, status: :private)
      end
    end

    trait :draft do
      after(:create) do |thought_analysis|
        create(:entry, entryable: thought_analysis, status: :draft)
      end
    end
  end
end
