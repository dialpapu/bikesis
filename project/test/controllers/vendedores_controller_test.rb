require 'test_helper'

class VendedoresControllerTest < ActionController::TestCase
  setup do
    @vendedore = vendedores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendedores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendedore" do
    assert_difference('Vendedores.count') do
      post :create, vendedore: { apellido: @vendedore.apellido, documento: @vendedore.documento, estadoPersona: @vendedore.estadoPersona, idPersona: @vendedore.idPersona, nombrePersona: @vendedore.nombrePersona, telefono: @vendedore.telefono }
    end

    assert_redirected_to vendedore_path(assigns(:vendedore))
  end

  test "should show vendedore" do
    get :show, id: @vendedore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendedore
    assert_response :success
  end

  test "should update vendedore" do
    patch :update, id: @vendedore, vendedore: { apellido: @vendedore.apellido, documento: @vendedore.documento, estadoPersona: @vendedore.estadoPersona, idPersona: @vendedore.idPersona, nombrePersona: @vendedore.nombrePersona, telefono: @vendedore.telefono }
    assert_redirected_to vendedore_path(assigns(:vendedore))
  end

  test "should destroy vendedore" do
    assert_difference('Vendedores.count', -1) do
      delete :destroy, id: @vendedore
    end

    assert_redirected_to vendedores_index_path
  end
end
