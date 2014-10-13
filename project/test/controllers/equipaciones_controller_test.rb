require 'test_helper'

class EquipacionesControllerTest < ActionController::TestCase
  setup do
    @equipacione = equipaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipacione" do
    assert_difference('Equipacione.count') do
      post :create, equipacione: { descripcion: @equipacione.descripcion, estadoProducto: @equipacione.estadoProducto, genero: @equipacione.genero, idProducto: @equipacione.idProducto, imagenProducto: @equipacione.imagenProducto, marcaProducto: @equipacione.marcaProducto, nombreProducto: @equipacione.nombreProducto, referenciaProducto: @equipacione.referenciaProducto, talla: @equipacione.talla, valorProducto: @equipacione.valorProducto }
    end

    assert_redirected_to equipacione_path(assigns(:equipacione))
  end

  test "should show equipacione" do
    get :show, id: @equipacione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipacione
    assert_response :success
  end

  test "should update equipacione" do
    patch :update, id: @equipacione, equipacione: { descripcion: @equipacione.descripcion, estadoProducto: @equipacione.estadoProducto, genero: @equipacione.genero, idProducto: @equipacione.idProducto, imagenProducto: @equipacione.imagenProducto, marcaProducto: @equipacione.marcaProducto, nombreProducto: @equipacione.nombreProducto, referenciaProducto: @equipacione.referenciaProducto, talla: @equipacione.talla, valorProducto: @equipacione.valorProducto }
    assert_redirected_to equipacione_path(assigns(:equipacione))
  end

  test "should destroy equipacione" do
    assert_difference('Equipacione.count', -1) do
      delete :destroy, id: @equipacione
    end

    assert_redirected_to equipaciones_path
  end
end
