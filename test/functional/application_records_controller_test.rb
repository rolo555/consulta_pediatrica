require 'test_helper'

class ApplicationRecordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_record" do
    assert_difference('ApplicationRecord.count') do
      post :create, :application_record => { }
    end

    assert_redirected_to application_record_path(assigns(:application_record))
  end

  test "should show application_record" do
    get :show, :id => application_records(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => application_records(:one).to_param
    assert_response :success
  end

  test "should update application_record" do
    put :update, :id => application_records(:one).to_param, :application_record => { }
    assert_redirected_to application_record_path(assigns(:application_record))
  end

  test "should destroy application_record" do
    assert_difference('ApplicationRecord.count', -1) do
      delete :destroy, :id => application_records(:one).to_param
    end

    assert_redirected_to application_records_path
  end
end
