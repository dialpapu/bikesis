class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @managers = Manager.all
    respond_with(@managers)
  end

  def show
    respond_with(@manager)
  end

  def new
    @manager = Manager.new
    respond_with(@manager)
  end

  def edit
  end

  def create
    @manager = Manager.new(manager_params)
    @manager.save
    respond_to do |format|
      if @index.save
        format.html { redirect_to @manager, notice: 'Gerente fue creado correctamente.' }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @manager.update(manager_params)
    respond_to do |format|
      if @pagina.update(manager_params)
        format.html { redirect_to @manager, notice: 'El gerente se ha modificado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to manager_url, notice: 'El gerente se ha deshabilitado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_manager
      @manager = Manager.find(params[:id])
    end

    def manager_params
      params.require(:manager).permit(:personId, :document, :personName, :lastName, :telephone, :personStatus)
    end
end
