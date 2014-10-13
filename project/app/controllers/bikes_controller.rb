class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @bikes = Bike.all
    respond_with(@bikes)
  end

  def show
    respond_with(@bike)
  end

  def new
    @bike = Bike.new
    respond_with(@bike)
  end

  def edit
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.save
    respond_to do |format|
      if @bike.save
        format.html { redirect_to @bike, notice: 'Bicicleta creada correctamente.' }
        format.json { render :show, status: :created, location: @bike }
      else
        format.html { render :new }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bike.update(bike_params)
    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to @bike, notice: 'La bicibleta se ha modificado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @bike }
      else
        format.html { render :edit }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bike.destroy
    respond_to do |format|
      format.html { redirect_to bike_url, notice: 'Bicileta ha sido deshabilitada.' }
      format.json { head :no_content }
    end
  end

  private
  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:productId, :productReference, :productName, :productTradeMark, :productImage, :productPrice, :productStatus, :productDescription, :measures, :bikeType)
  end
end
