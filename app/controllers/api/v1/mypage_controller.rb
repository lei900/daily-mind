class Api::V1::MypageController < Api::V1::BaseController
  # skip_before_action :authenticate

  def show
    json_string =
      UserSerializer
        .new(current_user, { params: { is_mypage: true } })
        .serializable_hash
        .to_json
    render json: json_string
  end
end
