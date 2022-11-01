# HTTPリクエストを認証する処理
# Looks for the Access Token in the Authorization header of an incoming request.
# If the token is present, it should be passed to JsonWebToken.verify.

class AuthorizationService
  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    verify_token
  end

  # def current_user
  #   @auth_payload, @auth_header = verify_token
  #   @user = User.current_user_from_token_payload(@auth_payload)
  # end

  # def create_user(name, user_image)
  #   @auth_payload, @auth_header = verify_token
  #   @user = User.create_user_from_token_payload(@auth_payload, name, user_image)
  # end

  private

  def http_token
    if @headers["Authorization"].present?
      @headers["Authorization"].split(" ").last
    end
  end

  # JsonWebToken: lib/json_web_token.rbに定義
  def verify_token
    JsonWebToken.verify(http_token)
  end
end
