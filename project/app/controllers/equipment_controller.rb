
class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @equipment = Equipment.all
    respond_with(@equipment)
  end

  def show
    respond_with(@equipment)
  end

  def new
    @equipment = Equipment.new
    respond_with(@equipment)
  end

  def edit
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.save
    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Equipamento creado correctamente.' }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to @equipment, notice: 'Equipamento modificado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @equipment.destroy
    respond_with(@equipment)
  end

  private
  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:productId, :productReference, :productName, :productTradeMark, :productImage, :productPrice, :productStatus, :productDescription, :size, :gender)
  end
end
