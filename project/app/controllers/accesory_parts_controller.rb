class AccesoryPartsController < ApplicationController
  before_action :set_accesory_part, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @accesory_parts = AccesoryPart.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PDF::Writer.new(:orientation => :landscape) 
        pdf.select_font 'Times-Roman'
        pdf.text "Reporte de Accesorios y repuestos generado en " + (Time.now()).strftime("%a %b %d, %Y") , :size => 30, :style => :bold  
        items = @accesory_partsline_items.map do |item|  
          [item.productId,  
            item.productReference,  
            item.productName,
            item.productTradeMark,  
            item.productStatus,  
            item.productDescription,
            item.typeElement ]
          end
          pdf.table items  

        end  

      end  
      
      

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
      respond_to do |format|
        if @accesory_part.save
          format.html { redirect_to @accesory_part, notice: 'Accesorio - Repuesto fue creado correctamente.' }
          format.json { render :show, status: :created, location: @accesory_part }
        else
          format.html { render :new }
          format.json { render json: @accesory_part.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @accesory_part.update(accesory_part_params)
          format.html { redirect_to @accesory_part, notice: 'Accesorio - Repuesto modificado satisfactoriamente.' }
          format.json { render :show, status: :ok, location: @accesory_part }
        else
          format.html { render :edit }
          format.json { render json: @accesory_part.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @accesory_part.destroy
      respond_to do |format|
        format.html { redirect_to accesory_part_url, notice: 'Accesorio repuesto se ha deshabilitado.' }
        format.json { head :no_content }
      end
    end

    private
    def set_accesory_part
      @accesory_part = AccesoryPart.find(params[:id])
    end

    def accesory_part_params
      params.require(:accesory_part).permit(:productId, :productReference, :productName, :productTradeMark, :productImage, :productPrice, :productStatus, :productDescription, :typeElement)
    end
  end
