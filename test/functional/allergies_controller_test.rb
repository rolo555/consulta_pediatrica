require 'test_helper'

class AllergiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allergy" do
    assert_difference('Allergy.count') do
      post :create, :record => { :substance => "substance", :reaction => "reaction" }
    end

    assert_redirected_to allergies_path
  end

  test "should show allergy" do
    get :show, :id => allergies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => allergies(:one).to_param
    assert_response :success
  end

  test "should update allergy" do
    put :update, :id => allergies(:one).to_param, :record => { :substance => "substance", :reaction => "reaction" }
    assert_redirected_to allergies_path
  end

  test "should destroy allergy" do
    assert_difference('Allergy.count', -1) do
      delete :destroy, :id => allergies(:one).to_param
    end

    assert_redirected_to allergies_path
  end

  test "should get show_search" do
    get :show_search
    assert_response :success
  end

  context "get help" do
    should "render with help layout" do
      get :help
      assert_equal "layouts/help", @response.layout
    end

    should "route to allergies/help" do
      assert_routing '/allergies/help', { :controller => "allergies", :action => "help" }
    end
  end
  
end
