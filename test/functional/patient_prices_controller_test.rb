require 'test_helper'

class PatientPricesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_price" do
    assert_difference('PatientPrice.count') do
      post :create, :patient_price => { }
    end

    assert_redirected_to patient_price_path(assigns(:patient_price))
  end

  test "should show patient_price" do
    get :show, :id => patient_prices(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => patient_prices(:one).to_param
    assert_response :success
  end

  test "should update patient_price" do
    put :update, :id => patient_prices(:one).to_param, :patient_price => { }
    assert_redirected_to patient_price_path(assigns(:patient_price))
  end

  test "should destroy patient_price" do
    assert_difference('PatientPrice.count', -1) do
      delete :destroy, :id => patient_prices(:one).to_param
    end

    assert_redirected_to patient_prices_path
  end
end
