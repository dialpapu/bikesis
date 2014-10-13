class GerentesController < ApplicationController
  before_action :set_gerente, only: [:show, :edit, :update, :destroy]

  def index
    @gerentes = Gerente.all
    respond_with(@gerentes)
  end

  def show
    respond_with(@gerente)
  end

  def new
    @gerente = Gerente.new
    respond_with(@gerente)
  end

  def edit
  end

  def create
    @gerente = Gerente.new(gerente_params)
    @gerente.save
    respond_with(@gerente)
  end

  def update
    @gerente.update(gerente_params)
    respond_with(@gerente)
  end

  def destroy
    @gerente.destroy
    respond_with(@gerente)
  end

  private
    def set_gerente
      @gerente = Gerente.find(params[:id])
    end

    def gerente_params
      params.require(:gerente).permit(:idPersona, :documento, :nombrePersona, :apellido, :telefono, :estadoPersona)
    end
end
