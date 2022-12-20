class Api::V1::Exercises::ParticipationsController < Api::V1::BaseController
  skip_before_action :authenticate

  def update
    exercise = Exercise.find(params[:exercise_id])
    exercise.increment!(:participants_number)
    head :ok
  end
end
