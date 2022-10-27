# == Schema Information
#
# Table name: thoutht_analyses
#
#  id               :bigint           not null, primary key
#  negative_thought :text
#  new_thought      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe ThouthtAnalysis, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
