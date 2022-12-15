# == Schema Information
#
# Table name: diaries
#
#  id         :bigint           not null, primary key
#  body       :text
#  mood       :integer          not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :diary do
    sequence(:title) { |n| "MyTitle-#{n}" }
    sequence(:body) { |n| "MyBody-#{n}" }
    mood { 1 }

    trait :published do
      after(:create) do |diary|
        create(:entry, entryable: diary, status: :published)
      end
    end

    trait :private do
      after(:create) do |diary|
        create(:entry, entryable: diary, status: :private)
      end
    end

    trait :draft do
      after(:create) do |diary|
        create(:entry, entryable: diary, status: :draft)
      end
    end
  end
end
