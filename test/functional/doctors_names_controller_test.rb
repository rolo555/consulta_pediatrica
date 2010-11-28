require 'test_helper'

class DoctorsNamesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctors_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctors_name" do
    assert_difference('DoctorsName.count') do
      post :create, :doctors_name => { }
    end

    assert_redirected_to doctors_name_path(assigns(:doctors_name))
  end

  test "should show doctors_name" do
    get :show, :id => doctors_names(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => doctors_names(:one).to_param
    assert_response :success
  end

  test "should update doctors_name" do
    put :update, :id => doctors_names(:one).to_param, :doctors_name => { }
    assert_redirected_to doctors_name_path(assigns(:doctors_name))
  end

  test "should destroy doctors_name" do
    assert_difference('DoctorsName.count', -1) do
      delete :destroy, :id => doctors_names(:one).to_param
    end

    assert_redirected_to doctors_names_path
  end
end
