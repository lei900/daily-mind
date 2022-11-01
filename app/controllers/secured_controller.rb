class SecuredController < ApplicationController
  before_action :authorize_request

  private

  def authorize_request
    AuthorizationService.new(request.headers).authenticate_request!
    # @current_user = authorization.current_user
  rescue JWT::VerificationError, JWT::DecodeError
    # @current_user = nil
    render json: { errors: ["Not Authenticated"] }, status: :unauthorized
  end

  # attr_reader :current_user
end
