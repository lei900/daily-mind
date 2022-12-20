class Api::V1::Exercises::ParticipationsController < Api::V1::BaseController
  skip_before_action :authenticate

  def update
    exercise = Exercise.find(params[:exercise_id])
    exercise.increment!(:participants_number) # rubocop:disable Rails/SkipsModelValidations
    head :ok
  end
end
