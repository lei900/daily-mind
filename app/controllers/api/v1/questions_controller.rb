class Api::V1::QuestionsController < Api::V1::BaseController
  skip_before_action :authorize_request

  def index
    questions = Question.where(exercise_id: params[:exercise_id])
    json_string = QuestionSerializer.new(questions).serializable_hash.to_json
    render json: json_string
  end

  def show
    question =
      Question.where(exercise_id: params[:exercise_id], id: params[:id])
    json_string = QuestionSerializer.new(question).serializable_hash.to_json
    render json: json_string
  end
end
