require 'test_helper'

class BalancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show balance" do
    get :show, :id => balances(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => balances(:one).to_param
    assert_response :success
  end

  context "update balance" do
    should "redirect to yearly" do
      put :update, :id => balances(:one).to_param, :record => { "date_finish(1i)"=>"2000", "date_start(1i)"=>"2000", "date_finish(2i)"=>"01", "date_start(2i)"=>"01", "date_finish(3i)"=>"01", "date_start(3i)"=>"01" }, :yearly => "yearly"
      assert_redirected_to balance_path(:yearly_balance)
    end

    should "redirect to monthly" do
      put :update, :id => balances(:one).to_param, :record => { "date_finish(1i)"=>"2000", "date_start(1i)"=>"2000", "date_finish(2i)"=>"01", "date_start(2i)"=>"01", "date_finish(3i)"=>"01", "date_start(3i)"=>"01" }, :monthly => "monthly"
      assert_redirected_to balance_path(:monthly_balance)
    end

    should "redirect to daily" do
      put :update, :id => balances(:one).to_param, :record => { "date_finish(1i)"=>"2000", "date_start(1i)"=>"2000", "date_finish(2i)"=>"01", "date_start(2i)"=>"01", "date_finish(3i)"=>"01", "date_start(3i)"=>"01" }
      assert_redirected_to balance_path(:daily_balance)
    end

    should "redirect to update" do
      BalancesController.any_instance.stubs(:successful?).returns(false)
      put :update, :id => balances(:one).to_param, :record => { }
      assert_response :success
    end
  end

  test "should destroy balance" do
    assert_difference('Balance.count', -1) do
      delete :destroy, :id => balances(:one).to_param
    end

    assert_redirected_to balances_path
  end
end
