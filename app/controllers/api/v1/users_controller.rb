class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate

  def show
    user = User.find_by!(uid: params[:uid])
    json_string =
      UserSerializer
        .new(user, { params: { is_mypage: false } })
        .serializable_hash
        .to_json
    render json: json_string
  end
end
