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
  include Entryable

  enum :mood,
       { awful: 0, bad: 1, normal: 2, good: 3, excellent: 4 },
       suffix: true
end
