class Api::V1::ChoicesController < Api::V1::BaseController
  skip_before_action :authenticate

  def index
    question = Question.find_by(qid: params[:qid])
    choices = question.choices
    json_string = ChoiceSerializer.new(choices).serializable_hash.to_json
    render json: json_string
  end
end
