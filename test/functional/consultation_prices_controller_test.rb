require 'test_helper'

class ConsultationPricesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultation_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultation_price" do
    assert_difference('ConsultationPrice.count') do
      post :create, :consultation_price => { }
    end

    assert_redirected_to consultation_price_path(assigns(:consultation_price))
  end

  test "should show consultation_price" do
    get :show, :id => consultation_prices(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => consultation_prices(:one).to_param
    assert_response :success
  end

  test "should update consultation_price" do
    put :update, :id => consultation_prices(:one).to_param, :consultation_price => { }
    assert_redirected_to consultation_price_path(assigns(:consultation_price))
  end

  test "should destroy consultation_price" do
    assert_difference('ConsultationPrice.count', -1) do
      delete :destroy, :id => consultation_prices(:one).to_param
    end

    assert_redirected_to consultation_prices_path
  end
end
