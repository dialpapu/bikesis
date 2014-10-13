class EquipacionesController < ApplicationController
  before_action :set_equipacione, only: [:show, :edit, :update, :destroy]

  def index
    @equipaciones = Equipacione.all
    respond_with(@equipaciones)
  end

  def show
    respond_with(@equipacione)
  end

  def new
    @equipacione = Equipacione.new
    respond_with(@equipacione)
  end

  def edit
  end

  def create
    @equipacione = Equipacione.new(equipacione_params)
    @equipacione.save
    respond_with(@equipacione)
  end

  def update
    @equipacione.update(equipacione_params)
    respond_with(@equipacione)
  end

  def destroy
    @equipacione.destroy
    respond_with(@equipacione)
  end

  private
    def set_equipacione
      @equipacione = Equipacione.find(params[:id])
    end

    def equipacione_params
      params.require(:equipacione).permit(:idProducto, :referenciaProducto, :nombreProducto, :marcaProducto, :imagenProducto, :valorProducto, :estadoProducto, :descripcion, :talla, :genero)
    end
end
