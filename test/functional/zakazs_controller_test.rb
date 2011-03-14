require 'test_helper'

class ZakazsControllerTest < ActionController::TestCase
  setup do
    @zakaz = zakazs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zakazs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zakaz" do
    assert_difference('Zakaz.count') do
      post :create, :zakaz => @zakaz.attributes
    end

    assert_redirected_to zakaz_path(assigns(:zakaz))
  end

  test "should show zakaz" do
    get :show, :id => @zakaz.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @zakaz.to_param
    assert_response :success
  end

  test "should update zakaz" do
    put :update, :id => @zakaz.to_param, :zakaz => @zakaz.attributes
    assert_redirected_to zakaz_path(assigns(:zakaz))
  end

  test "should destroy zakaz" do
    assert_difference('Zakaz.count', -1) do
      delete :destroy, :id => @zakaz.to_param
    end

    assert_redirected_to zakazs_path
  end
end
