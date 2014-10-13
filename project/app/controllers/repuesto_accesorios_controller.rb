class RepuestoAccesoriosController < ApplicationController
  before_action :set_repuesto_accesorio, only: [:show, :edit, :update, :destroy]

  def index
    @repuesto_accesorios = RepuestoAccesorio.all
    respond_with(@repuesto_accesorios)
  end

  def show
    respond_with(@repuesto_accesorio)
  end

  def new
    @repuesto_accesorio = RepuestoAccesorio.new
    respond_with(@repuesto_accesorio)
  end

  def edit
  end

  def create
    @repuesto_accesorio = RepuestoAccesorio.new(repuesto_accesorio_params)
    @repuesto_accesorio.save
    respond_with(@repuesto_accesorio)
  end

  def update
    @repuesto_accesorio.update(repuesto_accesorio_params)
    respond_with(@repuesto_accesorio)
  end

  def destroy
    @repuesto_accesorio.destroy
    respond_with(@repuesto_accesorio)
  end

  private
    def set_repuesto_accesorio
      @repuesto_accesorio = RepuestoAccesorio.find(params[:id])
    end

    def repuesto_accesorio_params
      params.require(:repuesto_accesorio).permit(:idProducto, :referenciaProducto, :nombreProducto, :marcaProducto, :imagenProducto, :valorProducto, :estadoProducto, :descripcion, :tipoElemento)
    end
end
