require 'test_helper'

class TransactsControllerTest < ActionController::TestCase
  setup do
    @transact = transacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transact" do
    assert_difference('Transact.count') do
      post :create, transact: { amount: @transact.amount, transactable_id: @transact.transactable_id, transactable_type: @transact.transactable_type }
    end

    assert_redirected_to transact_path(assigns(:transact))
  end

  test "should show transact" do
    get :show, id: @transact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transact
    assert_response :success
  end

  test "should update transact" do
    patch :update, id: @transact, transact: { amount: @transact.amount, transactable_id: @transact.transactable_id, transactable_type: @transact.transactable_type }
    assert_redirected_to transact_path(assigns(:transact))
  end

  test "should destroy transact" do
    assert_difference('Transact.count', -1) do
      delete :destroy, id: @transact
    end

    assert_redirected_to transacts_path
  end
end
