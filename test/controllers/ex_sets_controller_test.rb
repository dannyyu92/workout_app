require 'test_helper'

class ExSetsControllerTest < ActionController::TestCase
  setup do
    @ex_set = ex_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ex_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ex_set" do
    assert_difference('ExSet.count') do
      post :create, ex_set: { reps: @ex_set.reps, sets: @ex_set.sets, weight: @ex_set.weight }
    end

    assert_redirected_to ex_set_path(assigns(:ex_set))
  end

  test "should show ex_set" do
    get :show, id: @ex_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ex_set
    assert_response :success
  end

  test "should update ex_set" do
    patch :update, id: @ex_set, ex_set: { reps: @ex_set.reps, sets: @ex_set.sets, weight: @ex_set.weight }
    assert_redirected_to ex_set_path(assigns(:ex_set))
  end

  test "should destroy ex_set" do
    assert_difference('ExSet.count', -1) do
      delete :destroy, id: @ex_set
    end

    assert_redirected_to ex_sets_path
  end
end
