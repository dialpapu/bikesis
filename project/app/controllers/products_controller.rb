class ProductsController < ApplicationController

  respond_to :html, :xml, :json
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  
  end

  def show
  
  end

  def new
    @product = Product.new
    
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if Product.all.nil?
      @product.productId=1
    else
      @product.productId = Product.all.count+1
    end
    @product.productStatus=true
    @product.save
    respond_to do |format|
      if @product.typeProduct == 'EQUIPMENT'
        if @product.save
          format.html { redirect_to equipment_path(@product), notice: 'Equipacion creada correctamente.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :template => 'equipment/new' }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end

      if @product.typeProduct == 'BIKE'
        if @product.save
          format.html { redirect_to bike_index_path, notice: 'Bicicleta creada correctamente.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end

      if @product.typeProduct == 'ACCESORY' || @product.typeProduct == 'SPARE'
        if @product.save
          format.html { redirect_to accesory_part_index_path, notice: 'Accesorio - Repuesto creado correctamente.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
      
    end
  end

  def update
    @product.update(product_params)

  end

  def destroy
    @product.destroy
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:productId, :productReference, :productName, :productTradeMark, :productPrice, :productStatus, :productDescription, :typeProduct, :measures, :bikeType, :size, :gender, :image)
  end
end
