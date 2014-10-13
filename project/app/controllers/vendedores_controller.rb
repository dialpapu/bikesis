class VendedoresController < ApplicationController
  before_action :set_vendedore, only: [:show, :edit, :update, :destroy]

  def index
    @vendedores = Vendedore.all
    respond_with(@vendedores)
  end

  def show
    respond_with(@vendedore)
  end

  def new
    @vendedore = Vendedore.new
    respond_with(@vendedore)
  end

  def edit
  end

  def create
    @vendedore = Vendedore.new(vendedore_params)
    @vendedore.save
    respond_with(@vendedore)
  end

  def update
    @vendedore.update(vendedore_params)
    respond_with(@vendedore)
  end

  def destroy
    @vendedore.destroy
    respond_with(@vendedore)
  end

  private
    def set_vendedore
      @vendedore = Vendedore.find(params[:id])
    end

    def vendedore_params
      params.require(:vendedore).permit(:idPersona, :documento, :nombrePersona, :apellido, :telefono, :estadoPersona)
    end
end
