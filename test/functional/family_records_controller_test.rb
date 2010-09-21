require 'test_helper'

class FamilyRecordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:family_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create family_record" do
    assert_difference('FamilyRecord.count') do
      post :create, :family_record => { }
    end

    assert_redirected_to family_record_path(assigns(:family_record))
  end

  test "should show family_record" do
    get :show, :id => family_records(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => family_records(:one).to_param
    assert_response :success
  end

  test "should update family_record" do
    put :update, :id => family_records(:one).to_param, :family_record => { }
    assert_redirected_to family_record_path(assigns(:family_record))
  end

  test "should destroy family_record" do
    assert_difference('FamilyRecord.count', -1) do
      delete :destroy, :id => family_records(:one).to_param
    end

    assert_redirected_to family_records_path
  end
end
