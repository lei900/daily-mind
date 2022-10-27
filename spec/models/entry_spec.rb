# == Schema Information
#
# Table name: entries
#
#  id            :bigint           not null, primary key
#  entyable_type :string
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  community_id  :bigint
#  entryable_id  :integer
#  user_id       :bigint           not null
#
# Indexes
#
#  index_entries_on_community_id  (community_id)
#  index_entries_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (community_id => communities.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Entry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
