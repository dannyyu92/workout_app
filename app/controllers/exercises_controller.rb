class ExercisesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @exercise = Exercise.new
    set_user_id
    @exercise.ex_sets.build

    @exercises = Exercise.where(user_id: current_user.id)
    @all_exercises = @exercises.includes(:ex_sets).group_by(&:muscle_group)
  end

  def new
    @exercise = Exercise.new
    set_user_id
    @exercise.ex_sets.build
  end

  def show
    @exercise = Exercise.find(params[:id])
    set_user_id
  end

  def edit
    @exercise = Exercise.find(params[:id])
    set_user_id
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    set_user_id
    @exercise.destroy

    redirect_to user_exercises_path, notice: "Exercise successfully deleted"
  end

  def create
    @exercise = Exercise.new(exercise_params)
    set_user_id
    if @exercise.save
      redirect_to user_exercises_path, notice: "Exercise successfully created"
    else
      redirect_to user_exercises_path, notice: "Error: Exercise missing fields!"
    end
  end

  def update
    @exercise = Exercise.find(params[:id])
    set_user_id
    if @exercise.update_attributes(exercise_params)
      redirect_to user_exercises_path, notice: "Exercise successfully updated"
    else
      render action: "edit"
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :muscle_group, ex_sets_attributes: [:id, :sets, :reps, :weight])
  end

  def set_user_id
    @exercise.user_id = current_user.id
  end
end