class ExercisesController < ApplicationController
  def show
    @course = Exercise.find(params[:id])
  end

  def index
    @e = Exercise.all
  end
end
