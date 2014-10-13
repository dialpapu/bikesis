class HistorialContratosController < ApplicationController
  before_action :set_historial_contratos, only: [:show, :edit, :update, :destroy]

  def index
    @historial_contratos = HistorialContratos.all
    respond_with(@historial_contratos)
  end

  def show
    respond_with(@historial_contratos)
  end

  def new
    @historial_contratos = HistorialContratos.new
    respond_with(@historial_contratos)
  end

  def edit
  end

  def create
    @historial_contratos = HistorialContratos.new(historial_contratos_params)
    @historial_contrato.save
    respond_with(@historial_contratos)
  end

  def update
    @historial_contrato.update(historial_contratos_params)
    respond_with(@historial_contratos)
  end

  def destroy
    @historial_contrato.destroy
    respond_with(@historial_contratos)
  end

  private
    def set_historial_contratos
      @historial_contratos = HistorialContratos.find(params[:id])
    end

    def historial_contratos_params
      params.require(:historial_contratos).permit(:idPersona, :fechaContrato, :fechaFinContrato)
    end
end
