# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  entry_id   :bigint           not null
#  parent_id  :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_entry_id   (entry_id)
#  index_comments_on_parent_id  (parent_id)
#  index_comments_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (entry_id => entries.id)
#  fk_rails_...  (parent_id => comments.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :replies,
           class_name: "Comment",
           foreign_key: :parent_id,
           dependent: :destroy,
           inverse_of: :parent
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comment_likers, through: :likes, source: :user

  validates :body, presence: true, length: { maximum: 65_535 }
end
