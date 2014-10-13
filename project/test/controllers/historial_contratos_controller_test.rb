require 'test_helper'

class HistorialContratosControllerTest < ActionController::TestCase
  setup do
    @historial_contrato = historial_contratos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_contratos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_contrato" do
    assert_difference('HistorialContratos.count') do
      post :create, historial_contrato: { fechaContrato: @historial_contrato.fechaContrato, fechaFinContrato: @historial_contrato.fechaFinContrato, idPersona: @historial_contrato.idPersona }
    end

    assert_redirected_to historial_contrato_path(assigns(:historial_contrato))
  end

  test "should show historial_contrato" do
    get :show, id: @historial_contrato
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_contrato
    assert_response :success
  end

  test "should update historial_contrato" do
    patch :update, id: @historial_contrato, historial_contrato: { fechaContrato: @historial_contrato.fechaContrato, fechaFinContrato: @historial_contrato.fechaFinContrato, idPersona: @historial_contrato.idPersona }
    assert_redirected_to historial_contrato_path(assigns(:historial_contrato))
  end

  test "should destroy historial_contrato" do
    assert_difference('HistorialContratos.count', -1) do
      delete :destroy, id: @historial_contrato
    end

    assert_redirected_to historial_contratos_index_path
  end
end
