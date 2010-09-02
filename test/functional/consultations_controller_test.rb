require 'test_helper'

class ConsultationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultation" do
    assert_difference('Consultation.count') do
      post :create, :consultation => { }
    end

    assert_redirected_to consultation_path(assigns(:consultation))
  end

  test "should show consultation" do
    get :show, :id => consultations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => consultations(:one).to_param
    assert_response :success
  end

  test "should update consultation" do
    put :update, :id => consultations(:one).to_param, :consultation => { }
    assert_redirected_to consultation_path(assigns(:consultation))
  end

  test "should destroy consultation" do
    assert_difference('Consultation.count', -1) do
      delete :destroy, :id => consultations(:one).to_param
    end

    assert_redirected_to consultations_path
  end
end
