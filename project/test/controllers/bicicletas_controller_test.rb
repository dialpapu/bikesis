require 'test_helper'

class BicicletasControllerTest < ActionController::TestCase
  setup do
    @bicicleta = bicicletas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bicicletas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bicicleta" do
    assert_difference('Bicicletas.count') do
      post :create, bicicleta: { descripcion: @bicicleta.descripcion, estadoProducto: @bicicleta.estadoProducto, idProducto: @bicicleta.idProducto, imagenProducto: @bicicleta.imagenProducto, marcaProducto: @bicicleta.marcaProducto, medidas: @bicicleta.medidas, nombreProducto: @bicicleta.nombreProducto, referenciaProducto: @bicicleta.referenciaProducto, tipoBicicleta: @bicicleta.tipoBicicleta, valorProducto: @bicicleta.valorProducto }
    end

    assert_redirected_to bicicleta_path(assigns(:bicicleta))
  end

  test "should show bicicleta" do
    get :show, id: @bicicleta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bicicleta
    assert_response :success
  end

  test "should update bicicleta" do
    patch :update, id: @bicicleta, bicicleta: { descripcion: @bicicleta.descripcion, estadoProducto: @bicicleta.estadoProducto, idProducto: @bicicleta.idProducto, imagenProducto: @bicicleta.imagenProducto, marcaProducto: @bicicleta.marcaProducto, medidas: @bicicleta.medidas, nombreProducto: @bicicleta.nombreProducto, referenciaProducto: @bicicleta.referenciaProducto, tipoBicicleta: @bicicleta.tipoBicicleta, valorProducto: @bicicleta.valorProducto }
    assert_redirected_to bicicleta_path(assigns(:bicicleta))
  end

  test "should destroy bicicleta" do
    assert_difference('Bicicletas.count', -1) do
      delete :destroy, id: @bicicleta
    end

    assert_redirected_to bicicletas_index_path
  end
end
