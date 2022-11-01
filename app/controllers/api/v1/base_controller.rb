# base controller for API part

class Api::V1::BaseController < SecuredController
  include Api::ExceptionHandler
end
