class ExercisesController < ApplicationController
  def index
    @exercise = Exercise.new
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    redirect_to exercises_url
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercises_path, notice: "Exercise successfully created"
    else
      redirect_to exercises_path, notice: "Error: Exercise needs a name and muscle group!"
    end
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(exercise_params)
      redirect_to exercises_path, notice: "Exercise successfully updated"
    else
      render action: "edit"
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :muscle_group)
  end
end