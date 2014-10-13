class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
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
    respond_to do |format|
      if @seller.save
        format.html { redirect_to @seller, notice: 'Vendedor fue creado correctamente.' }
        format.json { render :show, status: :created, location: @seller }
      else
        format.html { render :new }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @seller.update(seller_params)
    respond_to do |format|
      if @pagina.update(seller_params)
        format.html { redirect_to @seller, notice: 'El vendedor se ha actualizado satisfactoriamente' }
        format.json { render :show, status: :ok, location: @seller }
      else
        format.html { render :edit }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to seller_url, notice: 'El vendedor se ha deshabilitado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_seller
      @seller = Seller.find(params[:id])
    end

    def seller_params
      params.require(:seller).permit(:personId, :document, :personName, :lastName, :telephone, :personStatus)
    end
end
