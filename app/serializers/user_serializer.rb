# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  nickname   :string           not null
#  role       :integer          default("general"), not null
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_uid  (uid) UNIQUE
#
class UserSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  attributes :avatar, :nickname, :bio, :role, :uid

  attribute :published_entries,
            if: proc { |_user, params| params && !params[:is_mypage] } do |user|
    EntrySerializer.new(
      user
        .entries
        .status_published
        .includes(:distortions, :community, :user, :entryable)
        .order(created_at: :desc),
    )
  end

  attribute :draft_entries,
            if: proc { |_user, params| params && params[:is_mypage] } do |user|
    user
      .entries
      .status_draft
      .includes(:distortions, :community, :user, :entryable)
      .order(created_at: :desc)
  end

  attribute :nondraft_entries,
            if: proc { |_user, params| params && params[:is_mypage] } do |user|
    user
      .entries
      .not_status_draft
      .includes(:distortions, :community, :user, :entryable)
      .order(created_at: :desc)
  end

  attribute :bookmarked_entries,
            if: proc { |_user, params| params && params[:is_mypage] } do |user|
    user
      .bookmarked_entries
      .includes(:distortions, :community, :user, :entryable)
      .order(created_at: :desc)
  end

  attribute :is_mypage do |_user, params|
    params[:is_mypage]
  end
end
