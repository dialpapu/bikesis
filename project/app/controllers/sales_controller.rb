class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @sales = Sale.all
    respond_with(@sales)
  end

  def show
    respond_with(@sale)
  end

  def new
    @sale = Sale.new
    respond_with(@sale)
  end

  def edit
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.save
    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Venta creada correctamente.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @sale.update(sale_params)
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Venta modificada satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sale.destroy
    respond_with(@sale)
  end

  private
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:saleId, :sellerId, :clientId, :saleDate, :saleStatus, :note)
    end
end
