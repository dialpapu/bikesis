class BicicletaController < ApplicationController
  before_action :set_bicicletum, only: [:show, :edit, :update, :destroy]

  def index
    @bicicleta = Bicicletum.all
    respond_with(@bicicleta)
  end

  def show
    respond_with(@bicicletum)
  end

  def new
    @bicicletum = Bicicletum.new
    respond_with(@bicicletum)
  end

  def edit
  end

  def create
    @bicicletum = Bicicletum.new(bicicletum_params)
    @bicicletum.save
    respond_with(@bicicletum)
  end

  def update
    @bicicletum.update(bicicletum_params)
    respond_with(@bicicletum)
  end

  def destroy
    @bicicletum.destroy
    respond_with(@bicicletum)
  end

  private
    def set_bicicletum
      @bicicletum = Bicicletum.find(params[:id])
    end

    def bicicletum_params
      params.require(:bicicletum).permit(:idProducto, :referenciaProducto, :nombreProducto, :marcaProducto, :imagenProducto, :valorProducto, :estadoProducto, :descripcion, :medidas, :tipoBicicleta)
    end
end
