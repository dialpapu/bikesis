class ClientesController < ApplicationController
  before_action :set_clientes, only: [:show, :edit, :update, :destroy]

  def index
    @clientes = Clientes.all
    respond_with(@clientes)
  end

  def show
    respond_with(@clientes)
  end

  def new
    @clientes = Clientes.new
    respond_with(@clientes)
  end

  def edit
  end

  def create
    @clientes = Clientes.new(clientes_params)
    @cliente.save
    respond_with(@clientes)
  end

  def update
    @cliente.update(clientes_params)
    respond_with(@clientes)
  end

  def destroy
    @cliente.destroy
    respond_with(@clientes)
  end

  private
    def set_clientes
      @clientes = Clientes.find(params[:id])
    end

    def clientes_params
      params.require(:clientes).permit(:idPersona, :documento, :nombrePersona, :apellido, :telefono, :estadoPersona, :fechaNacimiento, :permisoPublicidad)
    end
end
