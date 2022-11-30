# base controller for API part

class Api::V1::BaseController < ActionController::API
  include Api::ExceptionHandler
end
