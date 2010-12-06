require 'test_helper'

class VaccineSalesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vaccine_sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vaccine_sale" do
    assert_difference('VaccineSale.count') do
      post :create, :vaccine_sale => { }
    end

    assert_redirected_to vaccine_sale_path(assigns(:vaccine_sale))
  end

  test "should show vaccine_sale" do
    get :show, :id => vaccine_sales(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => vaccine_sales(:one).to_param
    assert_response :success
  end

  test "should update vaccine_sale" do
    put :update, :id => vaccine_sales(:one).to_param, :vaccine_sale => { }
    assert_redirected_to vaccine_sale_path(assigns(:vaccine_sale))
  end

  test "should destroy vaccine_sale" do
    assert_difference('VaccineSale.count', -1) do
      delete :destroy, :id => vaccine_sales(:one).to_param
    end

    assert_redirected_to vaccine_sales_path
  end
end
