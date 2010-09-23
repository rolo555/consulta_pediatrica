require 'test_helper'

class PathologicalRecordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pathological_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pathological_record" do
    assert_difference('PathologicalRecord.count') do
      post :create, :pathological_record => { }
    end

    assert_redirected_to pathological_record_path(assigns(:pathological_record))
  end

  test "should show pathological_record" do
    get :show, :id => pathological_records(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pathological_records(:one).to_param
    assert_response :success
  end

  test "should update pathological_record" do
    put :update, :id => pathological_records(:one).to_param, :pathological_record => { }
    assert_redirected_to pathological_record_path(assigns(:pathological_record))
  end

  test "should destroy pathological_record" do
    assert_difference('PathologicalRecord.count', -1) do
      delete :destroy, :id => pathological_records(:one).to_param
    end

    assert_redirected_to pathological_records_path
  end
end
