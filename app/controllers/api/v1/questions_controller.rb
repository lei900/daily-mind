class Api::V1::QuestionsController < Api::V1::BaseController
  skip_before_action :authenticate

  def index
    questions = Question.where(exercise_id: params[:exercise_id])
    json_string = QuestionSerializer.new(questions).serializable_hash.to_json
    render json: json_string
  end

  def show
    question =
      Question.where(exercise_id: params[:exercise_id], qid: params[:qid])
    json_string = QuestionSerializer.new(question).serializable_hash.to_json
    render json: json_string
  end
end
