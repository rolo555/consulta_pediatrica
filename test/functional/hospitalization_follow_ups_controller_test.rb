require 'test_helper'

class HospitalizationFollowUpsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hospitalization_follow_ups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hospitalization_follow_up" do
    assert_difference('HospitalizationFollowUp.count') do
      post :create, :hospitalization_follow_up => { }
    end

    assert_redirected_to hospitalization_follow_up_path(assigns(:hospitalization_follow_up))
  end

  test "should show hospitalization_follow_up" do
    get :show, :id => hospitalization_follow_ups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hospitalization_follow_ups(:one).to_param
    assert_response :success
  end

  test "should update hospitalization_follow_up" do
    put :update, :id => hospitalization_follow_ups(:one).to_param, :hospitalization_follow_up => { }
    assert_redirected_to hospitalization_follow_up_path(assigns(:hospitalization_follow_up))
  end

  test "should destroy hospitalization_follow_up" do
    assert_difference('HospitalizationFollowUp.count', -1) do
      delete :destroy, :id => hospitalization_follow_ups(:one).to_param
    end

    assert_redirected_to hospitalization_follow_ups_path
  end
end
