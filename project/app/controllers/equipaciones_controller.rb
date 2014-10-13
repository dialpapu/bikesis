class EquipacionesController < ApplicationController
  before_action :set_equipaciones, only: [:show, :edit, :update, :destroy]

  def index
    @equipaciones = Equipaciones.all
    respond_with(@equipaciones)
  end

  def show
    respond_with(@equipaciones)
  end

  def new
    @equipaciones = Equipaciones.new
    respond_with(@equipaciones)
  end

  def edit
  end

  def create
    @equipaciones = Equipaciones.new(equipaciones_params)
    @equipacione.save
    respond_with(@equipaciones)
  end

  def update
    @equipacione.update(equipaciones_params)
    respond_with(@equipaciones)
  end

  def destroy
    @equipacione.destroy
    respond_with(@equipaciones)
  end

  private
    def set_equipaciones
      @equipaciones = Equipaciones.find(params[:id])
    end

    def equipaciones_params
      params.require(:equipaciones).permit(:idProducto, :referenciaProducto, :nombreProducto, :marcaProducto, :imagenProducto, :valorProducto, :estadoProducto, :descripcion, :talla, :genero)
    end
end
