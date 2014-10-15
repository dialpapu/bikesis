class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  before_filter :authenticate_user!
  def index
    @bikes = Bike.all
    respond_to do |format|
      format.html
      format.pdf do
        generateReports(@bikes)
      end
    end
    
  end

  def show
    
  end

  def new
    @bike = Bike.new
  end

  def edit
  end

  def create

    @bike = Bike.new(bike_params)
    if Bike.all.nil?
      @bike.productId=1
    else
      @bike.productId = Bike.all.count+1
    end
    @bike.productStatus=true
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
  def generateReports(elements)
    pdf = PDF::Writer.new
        pdf.select_font "Times-Roman"
        pdf.image "public/images/logo.jpg", :justification => :center, :resize => 0.4
        pdf.text "Reporte de Bicicletas", :font_size => 40, :justification => :center
        pdf.text "Generado el "+ (Time.now()).strftime(" %b %d, %Y").to_s, :font_size => 15, :justification => :center
        elements.each do |item|  
          pdf.text "______________________________________________________", :font_size=>20 , :justification => :center
          pdf.text " "
          pdf.text "ID PRODUCTO: "+ item.productId.to_s, :font_size =>15
          pdf.text "REFERENCIA: "+item.productReference.to_s, :font_size => 15
          pdf.text "NOMBRE: " +item.productName.to_s, :font_size => 15
          pdf.text "MARCA: "+ item.productTradeMark.to_s, :font_size => 15
          pdf.text "PRECIO: "+ item.productPrice.to_s, :font_size => 15
          pdf.text "TIPO BICICLETA: "+ item.bikeType.to_s, :font_size => 15
          pdf.text "MEDIDAS: "+ item.measures.to_s, :font_size => 15
          pdf.text "DESCRIPCION: "+item.productDescription, :font_size => 15, :justification => :justify
          if item.productStatus==true 
            pdf.text "ESTADO: Habilitada", :font_size => 15, :justification => :rigth
          else
            pdf.text "ESTADO: Deshabilitada", :font_size => 15, :justification => :rigth
          end
   
        end
        pdf.render
        send_data pdf.render, :filename => 'Bicicletas.pdf', :type => 'application/pdf', :disposition => 'inline'
    
  end
end
