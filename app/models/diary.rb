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
class Diary < ApplicationRecord
  has_one :entry, as: :entryable, touch: true, dependent: :destroy

  enum :mood,
       { terrible: 0, bad: 1, neutral: 2, good: 3, great: 4 },
       suffix: true
end
