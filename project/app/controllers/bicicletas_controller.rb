class BicicletasController < ApplicationController
  before_action :set_bicicletas, only: [:show, :edit, :update, :destroy]

  def index
    @bicicletas = Bicicletas.all
    respond_with(@bicicletas)
  end

  def show
    respond_with(@bicicletas)
  end

  def new
    @bicicletas = Bicicletas.new
    respond_with(@bicicletas)
  end

  def edit
  end

  def create
    @bicicletas = Bicicletas.new(bicicletas_params)
    @bicicleta.save
    respond_with(@bicicletas)
  end

  def update
    @bicicleta.update(bicicletas_params)
    respond_with(@bicicletas)
  end

  def destroy
    @bicicleta.destroy
    respond_with(@bicicletas)
  end

  private
    def set_bicicletas
      @bicicletas = Bicicletas.find(params[:id])
    end

    def bicicletas_params
      params.require(:bicicletas).permit(:idProducto, :referenciaProducto, :nombreProducto, :marcaProducto, :imagenProducto, :valorProducto, :estadoProducto, :descripcion, :medidas, :tipoBicicleta)
    end
end
