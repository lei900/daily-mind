# Handling user login

class Api::V1::AuthenticationsController < Api::V1::BaseController
  def create
    if current_user
      json_string =
        UserSerializer
          .new(current_user, { params: { is_profile: true } })
          .serializable_hash
          .to_json
      render json: json_string
    end
  end
end
