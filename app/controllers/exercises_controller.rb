class ExercisesController < ApplicationController
  def index
    @exercise = Exercise.new
    @exercises = Exercise.all
    @exercise.ex_sets.build

    @all_exercises = @exercises.group_by(&:muscle_group)


  end

  def new
    @exercise = Exercise.new
    @exercise.ex_sets.build
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

    redirect_to exercises_url, notice: "Exercise successfully deleted"
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercises_path, notice: "Exercise successfully created"
    else
      redirect_to exercises_path, notice: "Error: Exercise missing fields!"
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
    params.require(:exercise).permit(:name, :muscle_group, ex_sets_attributes: [:id, :sets, :reps, :weight])
  end
end