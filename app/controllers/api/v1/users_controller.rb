class API::V1::UsersController < Api::V1::BaseController
  include Api::FirebaseAuthConcern
  include Api::CreateUserConcern
  include Api::UpdateUserConcern

  before_action :set_auth, only: %i[create update]

  def create
    create_user(@auth)
  end

  def update
    update_user(@auth)
  end

  private

  def set_auth
    @auth = authenticate_token_by_firebase
  end

  def user_params
    params.fetch(:user, {}).permit(:nickname)
  end
end
