require 'test_helper'

class VaccinesNamesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vaccines_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vaccines_name" do
    assert_difference('VaccinesName.count') do
      post :create, :vaccines_name => { }
    end

    assert_redirected_to vaccines_name_path(assigns(:vaccines_name))
  end

  test "should show vaccines_name" do
    get :show, :id => vaccines_names(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => vaccines_names(:one).to_param
    assert_response :success
  end

  test "should update vaccines_name" do
    put :update, :id => vaccines_names(:one).to_param, :vaccines_name => { }
    assert_redirected_to vaccines_name_path(assigns(:vaccines_name))
  end

  test "should destroy vaccines_name" do
    assert_difference('VaccinesName.count', -1) do
      delete :destroy, :id => vaccines_names(:one).to_param
    end

    assert_redirected_to vaccines_names_path
  end
end
