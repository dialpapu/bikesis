require 'test_helper'

class GerentesControllerTest < ActionController::TestCase
  setup do
    @gerente = gerentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gerentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gerente" do
    assert_difference('Gerentes.count') do
      post :create, gerente: { apellido: @gerente.apellido, documento: @gerente.documento, estadoPersona: @gerente.estadoPersona, idPersona: @gerente.idPersona, nombrePersona: @gerente.nombrePersona, telefono: @gerente.telefono }
    end

    assert_redirected_to gerente_path(assigns(:gerente))
  end

  test "should show gerente" do
    get :show, id: @gerente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gerente
    assert_response :success
  end

  test "should update gerente" do
    patch :update, id: @gerente, gerente: { apellido: @gerente.apellido, documento: @gerente.documento, estadoPersona: @gerente.estadoPersona, idPersona: @gerente.idPersona, nombrePersona: @gerente.nombrePersona, telefono: @gerente.telefono }
    assert_redirected_to gerente_path(assigns(:gerente))
  end

  test "should destroy gerente" do
    assert_difference('Gerentes.count', -1) do
      delete :destroy, id: @gerente
    end

    assert_redirected_to gerentes_index_path
  end
end
