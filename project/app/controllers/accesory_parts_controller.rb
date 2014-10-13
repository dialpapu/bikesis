class AccesoryPartsController < ApplicationController
  before_action :set_accesory_part, only: [:show, :edit, :update, :destroy]

  def index
    @accesory_parts = AccesoryPart.all
    respond_with(@accesory_parts)
  end

  def show
    respond_with(@accesory_part)
  end

  def new
    @accesory_part = AccesoryPart.new
    respond_with(@accesory_part)
  end

  def edit
  end

  def create
    @accesory_part = AccesoryPart.new(accesory_part_params)
    @accesory_part.save
    respond_with(@accesory_part)
  end

  def update
    @accesory_part.update(accesory_part_params)
    respond_with(@accesory_part)
  end

  def destroy
    @accesory_part.destroy
    respond_with(@accesory_part)
  end

  private
    def set_accesory_part
      @accesory_part = AccesoryPart.find(params[:id])
    end

    def accesory_part_params
      params.require(:accesory_part).permit(:productId, :productReference, :productName, :productTradeMark, :productImage, :productPrice, :productStatus, :productDescription, :typeElement)
    end
end
