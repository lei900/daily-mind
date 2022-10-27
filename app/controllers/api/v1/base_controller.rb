# base controller for API part

class API::V1::BaseController < ActionController::API
  include Api::ExceptionHandler
end
