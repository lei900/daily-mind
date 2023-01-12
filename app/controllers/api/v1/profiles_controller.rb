class Api::V1::ProfilesController < Api::V1::BaseController
  skip_before_action :authenticate

  def show
    json_string =
      UserSerializer
        .new(current_user, { params: { is_profile: true } })
        .serializable_hash
        .to_json
    render json: json_string
  end

  def update
    if current_user.update(profile_params)
      json_string =
        UserSerializer
          .new(current_user, { params: { is_profile: true } })
          .serializable_hash
          .to_json
      render json: json_string
    else
      render_400(nil, current_user.errors.full_messages)
    end
  end

  private

  def profile_params
    params.require(:user).permit(:avatar, :nickname, :bio)
  end
end
