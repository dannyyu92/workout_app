require 'test_helper'

class ExerciseDataControllerTest < ActionController::TestCase
  setup do
    @exercise_datum = exercise_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercise_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercise_datum" do
    assert_difference('ExerciseDatum.count') do
      post :create, exercise_datum: { repetitions: @exercise_datum.repetitions, sets: @exercise_datum.sets, weight: @exercise_datum.weight }
    end

    assert_redirected_to exercise_datum_path(assigns(:exercise_datum))
  end

  test "should show exercise_datum" do
    get :show, id: @exercise_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exercise_datum
    assert_response :success
  end

  test "should update exercise_datum" do
    patch :update, id: @exercise_datum, exercise_datum: { repetitions: @exercise_datum.repetitions, sets: @exercise_datum.sets, weight: @exercise_datum.weight }
    assert_redirected_to exercise_datum_path(assigns(:exercise_datum))
  end

  test "should destroy exercise_datum" do
    assert_difference('ExerciseDatum.count', -1) do
      delete :destroy, id: @exercise_datum
    end

    assert_redirected_to exercise_data_path
  end
end
