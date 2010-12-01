require 'test_helper'

class HospitalizationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hospitalizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hospitalization" do
    assert_difference('Hospitalization.count') do
      post :create, :hospitalization => { }
    end

    assert_redirected_to hospitalization_path(assigns(:hospitalization))
  end

  test "should show hospitalization" do
    get :show, :id => hospitalizations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hospitalizations(:one).to_param
    assert_response :success
  end

  test "should update hospitalization" do
    put :update, :id => hospitalizations(:one).to_param, :hospitalization => { }
    assert_redirected_to hospitalization_path(assigns(:hospitalization))
  end

  test "should destroy hospitalization" do
    assert_difference('Hospitalization.count', -1) do
      delete :destroy, :id => hospitalizations(:one).to_param
    end

    assert_redirected_to hospitalizations_path
  end
end
