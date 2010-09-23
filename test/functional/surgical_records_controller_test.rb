require 'test_helper'

class SurgicalRecordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surgical_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create surgical_record" do
    assert_difference('SurgicalRecord.count') do
      post :create, :surgical_record => { }
    end

    assert_redirected_to surgical_record_path(assigns(:surgical_record))
  end

  test "should show surgical_record" do
    get :show, :id => surgical_records(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => surgical_records(:one).to_param
    assert_response :success
  end

  test "should update surgical_record" do
    put :update, :id => surgical_records(:one).to_param, :surgical_record => { }
    assert_redirected_to surgical_record_path(assigns(:surgical_record))
  end

  test "should destroy surgical_record" do
    assert_difference('SurgicalRecord.count', -1) do
      delete :destroy, :id => surgical_records(:one).to_param
    end

    assert_redirected_to surgical_records_path
  end
end
