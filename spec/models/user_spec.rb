# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  nickname   :string
#  role       :integer          default("general"), not null
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_uid  (uid) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
