class Api::V1::ChoicesController < Api::V1::BaseController
  skip_before_action :authenticate

  def index
    question =
      Question.where(exercise_id: params[:exercise_id], qid: params[:qid])
    choices = question[0].choices.order(:id)
    json_string = ChoiceSerializer.new(choices).serializable_hash.to_json
    render json: json_string
  end
end
