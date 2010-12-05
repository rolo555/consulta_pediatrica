require 'test_helper'

class ImmunizationRecordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:immunization_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create immunization_record" do
    assert_difference('ImmunizationRecord.count') do
      post :create, :immunization_record => { }
    end

    assert_redirected_to immunization_record_path(assigns(:immunization_record))
  end

  test "should show immunization_record" do
    get :show, :id => immunization_records(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => immunization_records(:one).to_param
    assert_response :success
  end

  test "should update immunization_record" do
    put :update, :id => immunization_records(:one).to_param, :immunization_record => { }
    assert_redirected_to immunization_record_path(assigns(:immunization_record))
  end

  test "should destroy immunization_record" do
    assert_difference('ImmunizationRecord.count', -1) do
      delete :destroy, :id => immunization_records(:one).to_param
    end

    assert_redirected_to immunization_records_path
  end
end
