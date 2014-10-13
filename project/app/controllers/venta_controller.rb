class VentaController < ApplicationController
  before_action :set_ventum, only: [:show, :edit, :update, :destroy]

  def index
    @venta = Ventum.all
    respond_with(@venta)
  end

  def show
    respond_with(@ventum)
  end

  def new
    @ventum = Ventum.new
    respond_with(@ventum)
  end

  def edit
  end

  def create
    @ventum = Ventum.new(ventum_params)
    @ventum.save
    respond_with(@ventum)
  end

  def update
    @ventum.update(ventum_params)
    respond_with(@ventum)
  end

  def destroy
    @ventum.destroy
    respond_with(@ventum)
  end

  private
    def set_ventum
      @ventum = Ventum.find(params[:id])
    end

    def ventum_params
      params.require(:ventum).permit(:idVenta, :idVendedor, :idCliente, :fechaVenta, :estadoVenta, :observaciones)
    end
end
