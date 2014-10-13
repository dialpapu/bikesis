class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

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
    respond_with(@equipment)
  end

  def update
    @equipment.update(equipment_params)
    respond_with(@equipment)
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
