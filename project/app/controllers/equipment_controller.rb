class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  before_filter :authenticate_user!
  def index
    @equipment = Equipment.all
    respond_to do |format|
      format.html
      format.pdf do
        generateReports(@equipment)
      end
    end
  end

  def show

  end

  def new
    @equipment = Equipment.new
    
  end

  def edit
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if Equipment.all.nil?
      @equipment.productId=1
    else
      @equipment.productId = Equipment.all.count+1
    end
    @equipment.productStatus=true
    @equipment.productReference=equipment_params[:productReference].upcase
    @equipment.productName=equipment_params[:productName].capitalize
    @equipment.productTradeMark=equipment_params[:productTradeMark].upcase
    @equipment.size=equipment_params[:size].upcase
    @equipment.gender=equipment_params[:gender].upcase
    @equipment.save
    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Equipacion creada correctamente.' }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to @equipment, notice: 'Equipacion  actualizada satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@equipment.destroy
    respond_to do |format|
      if @equipment.productStatus==true
        format.html { redirect_to equipment_index_url, notice: 'Equipacion deshabilitada.' }
        @equipment.productStatus=false
      else
        format.html { redirect_to equipment_index_url, notice: 'La equipacion ha sido habilitada.' }
        @equipment.productStatus=true
      end
      format.json { head :no_content }
    end
    @equipment.save
  end


private
def set_equipment
  @equipment = Equipment.find(params[:id])
end

def equipment_params
  params.require(:equipment).permit(:productId, :productReference, :productName, :productTradeMark, :productImage, :productPrice, :productStatus, :productDescription, :size, :gender, :image)
end
def generateReports(elements)
  pdf = PDF::Writer.new
  pdf.select_font "Times-Roman"
  pdf.image "public/images/logo.jpg", :justification => :center, :resize => 0.4
  pdf.text "Reporte de Equipaciones", :font_size => 40, :justification => :center
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
    pdf.text "TAMANO: "+item.size.to_s, :font_size => 15
    pdf.text "GENDER : "+item.gender.to_s, :font_size => 15
    if item.productStatus==true 
      pdf.text "ESTADO: Habilitada", :font_size => 15, :justification => :rigth
    else
      pdf.text "ESTADO: Deshabilitada", :font_size => 15, :justification => :rigth
    end
  end
  pdf.render
  send_data pdf.render, :filename => 'Equipaciones.pdf', :type => 'application/pdf', :disposition => 'inline'

end
end


