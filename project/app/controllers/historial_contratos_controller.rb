class HistorialContratosController < ApplicationController
  before_action :set_historial_contrato, only: [:show, :edit, :update, :destroy]

  def index
    @historial_contratos = HistorialContrato.all
    respond_with(@historial_contratos)
  end

  def show
    respond_with(@historial_contrato)
  end

  def new
    @historial_contrato = HistorialContrato.new
    respond_with(@historial_contrato)
  end

  def edit
  end

  def create
    @historial_contrato = HistorialContrato.new(historial_contrato_params)
    @historial_contrato.save
    respond_with(@historial_contrato)
  end

  def update
    @historial_contrato.update(historial_contrato_params)
    respond_with(@historial_contrato)
  end

  def destroy
    @historial_contrato.destroy
    respond_with(@historial_contrato)
  end

  private
    def set_historial_contrato
      @historial_contrato = HistorialContrato.find(params[:id])
    end

    def historial_contrato_params
      params.require(:historial_contrato).permit(:idPersona, :fechaContrato, :fechaFinContrato)
    end
end
