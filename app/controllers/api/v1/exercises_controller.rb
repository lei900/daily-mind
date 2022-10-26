module Api
  module V1
    class ExercisesController < BaseController
      def index
        exercises = Exercise.all
        json_string =
          ExerciseSerializer.new(exercises).serializable_hash.to_json
        render json: json_string
      end

      def show
        exercise = Exercise.find(params[:id])
        json_string = ExerciseSerializer.new(exercise).serializable_hash.to_json
        render json: json_string
      end
    end
  end
end
