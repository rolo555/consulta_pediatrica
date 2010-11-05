require 'test_helper'

class SurgeriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surgeries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create surgery" do
    assert_difference('Surgery.count') do
      post :create, :surgery => { }
    end

    assert_redirected_to surgery_path(assigns(:surgery))
  end

  test "should show surgery" do
    get :show, :id => surgeries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => surgeries(:one).to_param
    assert_response :success
  end

  test "should update surgery" do
    put :update, :id => surgeries(:one).to_param, :surgery => { }
    assert_redirected_to surgery_path(assigns(:surgery))
  end

  test "should destroy surgery" do
    assert_difference('Surgery.count', -1) do
      delete :destroy, :id => surgeries(:one).to_param
    end

    assert_redirected_to surgeries_path
  end
end
