require 'test_helper'

class LaboratoryProfilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laboratory_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laboratory_profile" do
    assert_difference('LaboratoryProfile.count') do
      post :create, :laboratory_profile => { }
    end

    assert_redirected_to laboratory_profile_path(assigns(:laboratory_profile))
  end

  test "should show laboratory_profile" do
    get :show, :id => laboratory_profiles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => laboratory_profiles(:one).to_param
    assert_response :success
  end

  test "should update laboratory_profile" do
    put :update, :id => laboratory_profiles(:one).to_param, :laboratory_profile => { }
    assert_redirected_to laboratory_profile_path(assigns(:laboratory_profile))
  end

  test "should destroy laboratory_profile" do
    assert_difference('LaboratoryProfile.count', -1) do
      delete :destroy, :id => laboratory_profiles(:one).to_param
    end

    assert_redirected_to laboratory_profiles_path
  end
end
