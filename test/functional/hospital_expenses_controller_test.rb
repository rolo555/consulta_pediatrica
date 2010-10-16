require 'test_helper'

class HospitalExpensesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hospital_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hospital_expense" do
    assert_difference('HospitalExpense.count') do
      post :create, :hospital_expense => { }
    end

    assert_redirected_to hospital_expense_path(assigns(:hospital_expense))
  end

  test "should show hospital_expense" do
    get :show, :id => hospital_expenses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hospital_expenses(:one).to_param
    assert_response :success
  end

  test "should update hospital_expense" do
    put :update, :id => hospital_expenses(:one).to_param, :hospital_expense => { }
    assert_redirected_to hospital_expense_path(assigns(:hospital_expense))
  end

  test "should destroy hospital_expense" do
    assert_difference('HospitalExpense.count', -1) do
      delete :destroy, :id => hospital_expenses(:one).to_param
    end

    assert_redirected_to hospital_expenses_path
  end
end
