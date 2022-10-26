module Api
  module V1
    class ExercisesController < BaseController
      def index
        excercises = Excercise.all
        json_string = ExcerciseSerializer.new(articles).serialized_json
        render json: json_string
      end

      def show
        excercise = Excercise.find(params[:id])
        json_string = ExcerciseSerializer.new(article).serialized_json
        render json: json_string
      end
    end
  end
end
