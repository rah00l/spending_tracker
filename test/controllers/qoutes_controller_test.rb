require 'test_helper'

class QoutesControllerTest < ActionController::TestCase
  setup do
    @qoute = qoutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qoutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qoute" do
    assert_difference('Qoute.count') do
      post :create, qoute: { message: @qoute.message, qoute_by: @qoute.qoute_by, user_id: @qoute.user_id }
    end

    assert_redirected_to qoute_path(assigns(:qoute))
  end

  test "should show qoute" do
    get :show, id: @qoute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qoute
    assert_response :success
  end

  test "should update qoute" do
    patch :update, id: @qoute, qoute: { message: @qoute.message, qoute_by: @qoute.qoute_by, user_id: @qoute.user_id }
    assert_redirected_to qoute_path(assigns(:qoute))
  end

  test "should destroy qoute" do
    assert_difference('Qoute.count', -1) do
      delete :destroy, id: @qoute
    end

    assert_redirected_to qoutes_path
  end
end
