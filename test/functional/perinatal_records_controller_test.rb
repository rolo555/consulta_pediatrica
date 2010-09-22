require 'test_helper'

class PerinatalRecordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perinatal_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perinatal_record" do
    assert_difference('PerinatalRecord.count') do
      post :create, :perinatal_record => { }
    end

    assert_redirected_to perinatal_record_path(assigns(:perinatal_record))
  end

  test "should show perinatal_record" do
    get :show, :id => perinatal_records(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => perinatal_records(:one).to_param
    assert_response :success
  end

  test "should update perinatal_record" do
    put :update, :id => perinatal_records(:one).to_param, :perinatal_record => { }
    assert_redirected_to perinatal_record_path(assigns(:perinatal_record))
  end

  test "should destroy perinatal_record" do
    assert_difference('PerinatalRecord.count', -1) do
      delete :destroy, :id => perinatal_records(:one).to_param
    end

    assert_redirected_to perinatal_records_path
  end
end
