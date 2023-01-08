# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  entry_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_bookmarks_on_entry_id              (entry_id)
#  index_bookmarks_on_user_id               (user_id)
#  index_bookmarks_on_user_id_and_entry_id  (user_id,entry_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (entry_id => entries.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :bookmark do
    user { nil }
    entry { nil }
  end
end
