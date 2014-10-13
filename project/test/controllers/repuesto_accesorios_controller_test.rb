require 'test_helper'

class RepuestoAccesoriosControllerTest < ActionController::TestCase
  setup do
    @repuesto_accesorio = repuesto_accesorios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repuesto_accesorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repuesto_accesorio" do
    assert_difference('RepuestoAccesorio.count') do
      post :create, repuesto_accesorio: { descripcion: @repuesto_accesorio.descripcion, estadoProducto: @repuesto_accesorio.estadoProducto, idProducto: @repuesto_accesorio.idProducto, imagenProducto: @repuesto_accesorio.imagenProducto, marcaProducto: @repuesto_accesorio.marcaProducto, nombreProducto: @repuesto_accesorio.nombreProducto, referenciaProducto: @repuesto_accesorio.referenciaProducto, tipoElemento: @repuesto_accesorio.tipoElemento, valorProducto: @repuesto_accesorio.valorProducto }
    end

    assert_redirected_to repuesto_accesorio_path(assigns(:repuesto_accesorio))
  end

  test "should show repuesto_accesorio" do
    get :show, id: @repuesto_accesorio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repuesto_accesorio
    assert_response :success
  end

  test "should update repuesto_accesorio" do
    patch :update, id: @repuesto_accesorio, repuesto_accesorio: { descripcion: @repuesto_accesorio.descripcion, estadoProducto: @repuesto_accesorio.estadoProducto, idProducto: @repuesto_accesorio.idProducto, imagenProducto: @repuesto_accesorio.imagenProducto, marcaProducto: @repuesto_accesorio.marcaProducto, nombreProducto: @repuesto_accesorio.nombreProducto, referenciaProducto: @repuesto_accesorio.referenciaProducto, tipoElemento: @repuesto_accesorio.tipoElemento, valorProducto: @repuesto_accesorio.valorProducto }
    assert_redirected_to repuesto_accesorio_path(assigns(:repuesto_accesorio))
  end

  test "should destroy repuesto_accesorio" do
    assert_difference('RepuestoAccesorio.count', -1) do
      delete :destroy, id: @repuesto_accesorio
    end

    assert_redirected_to repuesto_accesorios_path
  end
end
