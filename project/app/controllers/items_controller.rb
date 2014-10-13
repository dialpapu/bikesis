class ItemsController < ApplicationController
  before_action :set_items, only: [:show, :edit, :update, :destroy]

  def index
    @items = Items.all
    respond_with(@items)
  end

  def show
    respond_with(@items)
  end

  def new
    @items = Items.new
    respond_with(@items)
  end

  def edit
  end

  def create
    @items = Items.new(items_params)
    @item.save
    respond_with(@items)
  end

  def update
    @item.update(items_params)
    respond_with(@items)
  end

  def destroy
    @item.destroy
    respond_with(@items)
  end

  private
    def set_items
      @items = Items.find(params[:id])
    end

    def items_params
      params.require(:items).permit(:idVenta, :idProducto, :cantidadItem)
    end
end
