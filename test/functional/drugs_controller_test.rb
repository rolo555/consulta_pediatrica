require 'test_helper'

class DrugsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drugs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drug" do
    assert_difference('Drug.count') do
      post :create, :drug => { }
    end

    assert_redirected_to drug_path(assigns(:drug))
  end

  test "should show drug" do
    get :show, :id => drugs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => drugs(:one).to_param
    assert_response :success
  end

  test "should update drug" do
    put :update, :id => drugs(:one).to_param, :drug => { }
    assert_redirected_to drug_path(assigns(:drug))
  end

  test "should destroy drug" do
    assert_difference('Drug.count', -1) do
      delete :destroy, :id => drugs(:one).to_param
    end

    assert_redirected_to drugs_path
  end
end
