require 'test_helper'

class AvisosControllerTest < ActionController::TestCase
  setup do
    @aviso = avisos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:avisos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aviso" do
    assert_difference('Aviso.count') do
      post :create, aviso: { quadro_de_avisos: @aviso.quadro_de_avisos }
    end

    assert_redirected_to aviso_path(assigns(:aviso))
  end

  test "should show aviso" do
    get :show, id: @aviso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aviso
    assert_response :success
  end

  test "should update aviso" do
    put :update, id: @aviso, aviso: { quadro_de_avisos: @aviso.quadro_de_avisos }
    assert_redirected_to aviso_path(assigns(:aviso))
  end

  test "should destroy aviso" do
    assert_difference('Aviso.count', -1) do
      delete :destroy, id: @aviso
    end

    assert_redirected_to avisos_path
  end
end
