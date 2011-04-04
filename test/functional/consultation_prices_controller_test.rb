require 'test_helper'

class ConsultationPricesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultation_price" do
    assert_difference('ConsultationPrice.count') do
      post :create, :record => { :price_type => "a", :amount => 1 }
    end

    assert_redirected_to consultation_prices_path
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
    put :update, :id => consultation_prices(:one).to_param, :record => { }
    assert_redirected_to consultation_prices_path
  end

  test "should destroy consultation_price" do
    assert_difference('ConsultationPrice.count', -1) do
      delete :destroy, :id => consultation_prices(:one).to_param
    end

    assert_redirected_to consultation_prices_path
  end

  test "should render text null if params[selected] is false" do
    get :warning_message, { :selected => false }
    assert_template :text => ""
  end

  test "should render partial messages if params[selected] is true" do
    get :warning_message, { :selected => true }
    assert_template :partial => 'messages'
#    @controller.expects(:messages)
  end

end
