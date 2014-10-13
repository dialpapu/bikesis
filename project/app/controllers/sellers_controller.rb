class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]

  def index
    @sellers = Seller.all
    respond_with(@sellers)
  end

  def show
    respond_with(@seller)
  end

  def new
    @seller = Seller.new
    respond_with(@seller)
  end

  def edit
  end

  def create
    @seller = Seller.new(seller_params)
    @seller.save
    respond_with(@seller)
  end

  def update
    @seller.update(seller_params)
    respond_with(@seller)
  end

  def destroy
    @seller.destroy
    respond_with(@seller)
  end

  private
    def set_seller
      @seller = Seller.find(params[:id])
    end

    def seller_params
      params.require(:seller).permit(:personId, :document, :personName, :lastName, :telephone, :personStatus)
    end
end
