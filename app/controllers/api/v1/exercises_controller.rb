class Api::V1::ExercisesController < Api::V1::BaseController
  skip_before_action :authenticate

  def index
    exercises = Exercise.all
    json_string = ExerciseSerializer.new(exercises).serializable_hash.to_json
    render json: json_string
  end

  def show
    exercise = Exercise.find(params[:id])
    json_string = ExerciseSerializer.new(exercise).serializable_hash.to_json
    render json: json_string
  end
end
