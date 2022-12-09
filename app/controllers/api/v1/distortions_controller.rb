class Api::V1::DistortionsController < Api::V1::BaseController
  skip_before_action :authenticate

  def index
    distortions = Distortion.all
    json_string =
      DistortionSerializer.new(distortions).serializable_hash.to_json
    render json: json_string
  end
end
