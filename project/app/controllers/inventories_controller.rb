class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @inventories = Inventory.all
    respond_with(@inventories)
  end

  def show
    respond_with(@inventory)
  end

  def new
    @inventory = Inventory.new
    respond_with(@inventory)
  end

  def edit
  end

  def create
    @inventory = Inventory.new(inventory_params)
    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventario fue creado correctamente.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @inventory.update(manager_params)
        format.html { redirect_to @inventory, notice: 'Inventario modificado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory.destroy
    respond_with(@inventory)
  end

  private
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def inventory_params
      params.require(:inventory).permit(:productAmount, :productId)
    end
end