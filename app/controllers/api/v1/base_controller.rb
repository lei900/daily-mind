# base controller for API part

module Api
  module V1
    class BaseController < ActionController::API
      include Api::ExceptionHandler
    end
  end
end
