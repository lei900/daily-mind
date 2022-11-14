module Api::UpdateUserConcern
  extend ActiveSupport::Concern

  def update_user(auth)
    render json: auth, status: :unauthorized and return unless auth[:data]

    uid = auth[:data][:uid]
    user = User.find_by(uid: uid)
    if user.blank?
      render json: { error: "ユーザが存在しません" }, status: :not_found and return
    end

    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
end
