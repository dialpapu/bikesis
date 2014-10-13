class VendedoresController < ApplicationController
  before_action :set_vendedores, only: [:show, :edit, :update, :destroy]

  def index
    @vendedores = Vendedores.all
    respond_with(@vendedores)
  end

  def show
    respond_with(@vendedores)
  end

  def new
    @vendedores = Vendedores.new
    respond_with(@vendedores)
  end

  def edit
  end

  def create
    @vendedores = Vendedores.new(vendedores_params)
    @vendedore.save
    respond_with(@vendedores)
  end

  def update
    @vendedore.update(vendedores_params)
    respond_with(@vendedores)
  end

  def destroy
    @vendedore.destroy
    respond_with(@vendedores)
  end

  private
    def set_vendedores
      @vendedores = Vendedores.find(params[:id])
    end

    def vendedores_params
      params.require(:vendedores).permit(:idPersona, :documento, :nombrePersona, :apellido, :telefono, :estadoPersona)
    end
end
