class AccesoryPartsController < ApplicationController
  before_action :set_accesory_part, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @accesory_parts = AccesoryPart.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PDF::Writer.new
        pdf.select_font "Times-Roman"
        pdf.image "public/images/logo.jpg", :justification => :center, :resize => 0.4
        pdf.text "Reporte de Repuestos y accesorios", :font_size => 40, :justification => :center
        pdf.text "Generado el "+ (Time.now()).strftime(" %b %d, %Y").to_s, :font_size => 15, :justification => :center
        @accesory_parts.each do |item|  
          pdf.text "______________________________________________________", :font_size=>20 , :justification => :center
          pdf.text " "
          pdf.text "ID PRODUCTO: "+ item.productId.to_s, :font_size =>15
          pdf.text "REFERENCIA: "+item.productReference.to_s, :font_size => 15
          pdf.text "NOMBRE: " +item.productName.to_s, :font_size => 15
          pdf.text "MARCA: "+ item.productTradeMark.to_s, :font_size => 15
          pdf.text "DESCRIPCION: "+item.productDescription, :font_size => 15, :justification => :rigth
          pdf.text "TIPO ELEMENTO: "+item.typeElement.to_s, :font_size => 15, :justification => :justify
          if item.productStatus==true 
            pdf.text "ESTADO: Habilitado", :font_size => 15, :justification => :rigth
          else
            pdf.text "ESTADO: Deshabilitado", :font_size => 15, :justification => :rigth
          end
        end
        pdf.render
        send_data pdf.render, :filename => 'articulos_y_accesorios.pdf', :type => 'application/pdf', :disposition => 'inline'
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
