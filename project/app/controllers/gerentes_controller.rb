class GerentesController < ApplicationController
  before_action :set_gerentes, only: [:show, :edit, :update, :destroy]

  def index
    @gerentes = Gerentes.all
    respond_with(@gerentes)
  end

  def show
    respond_with(@gerentes)
  end

  def new
    @gerentes = Gerentes.new
    respond_with(@gerentes)
  end

  def edit
  end

  def create
    @gerentes = Gerentes.new(gerentes_params)
    @gerente.save
    respond_with(@gerentes)
  end

  def update
    @gerente.update(gerentes_params)
    respond_with(@gerentes)
  end

  def destroy
    @gerente.destroy
    respond_with(@gerentes)
  end

  private
    def set_gerentes
      @gerentes = Gerentes.find(params[:id])
    end

    def gerentes_params
      params.require(:gerentes).permit(:idPersona, :documento, :nombrePersona, :apellido, :telefono, :estadoPersona)
    end
end
