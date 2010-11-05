require 'test_helper'

class SurgicalStaffsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surgical_staffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create surgical_staff" do
    assert_difference('SurgicalStaff.count') do
      post :create, :surgical_staff => { }
    end

    assert_redirected_to surgical_staff_path(assigns(:surgical_staff))
  end

  test "should show surgical_staff" do
    get :show, :id => surgical_staffs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => surgical_staffs(:one).to_param
    assert_response :success
  end

  test "should update surgical_staff" do
    put :update, :id => surgical_staffs(:one).to_param, :surgical_staff => { }
    assert_redirected_to surgical_staff_path(assigns(:surgical_staff))
  end

  test "should destroy surgical_staff" do
    assert_difference('SurgicalStaff.count', -1) do
      delete :destroy, :id => surgical_staffs(:one).to_param
    end

    assert_redirected_to surgical_staffs_path
  end
end
