class SellersController < ApplicationController
	def index
		#@sellers = User.find(:all, :conditions => { :userType => 'Seller' })
		@sellers = User.where(:userType => 'Seller')
		respond_to do |format|
			format.html
			format.pdf do
				generateReport(@sellers)
			end
		end

	end

  def new
    @seller= User.new
  end

  def create
    @seller = User.new(seller_params)
  end


  private
  def set_seller
    @seller = User.find(params[:id])
  end

  def seller_params
    params.require(:seller).permit(:personId,:username, :email, :userLastName,:document,:telephone, :userType, :status, :password, :password_confirmation)

  end

  def generateReport(elements)
    def generateReport(elements)
      pdf = PDF::Writer.new
      pdf.select_font "Times-Roman"
      pdf.image "public/images/logo.jpg", :justification => :center, :resize => 0.4
      pdf.text "Reporte de Vendedores", :font_size => 40, :justification => :center
      pdf.text "Generado el "+ (Time.now()).strftime(" %b %d, %Y").to_s, :font_size => 15, :justification => :center
      elements.each do |item|  
        pdf.text "______________________________________________________", :font_size=>20 , :justification => :center
        pdf.text " "
        pdf.text "ID PERSONA: "+ item.id.to_s, :font_size =>15
        pdf.text "DOCUMENTO: "+item.document.to_s, :font_size => 15
        pdf.text "NOMBRE: " +item.username.to_s, :font_size => 15
        pdf.text "APELLIDO: "+ item.userLastName.to_s, :font_size => 15
        pdf.text "TELEFONO: "+ item.telephone.to_s, :font_size => 15
        if item.status==true 
          pdf.text "ESTADO: Habilitado", :font_size => 15, :justification => :rigth
        else
          pdf.text "ESTADO: Deshabilitado", :font_size => 15, :justification => :rigth
        end
      end
      pdf.render
      send_data pdf.render, :filename => 'Vendedores.pdf', :type => 'application/pdf', :disposition => 'inline'
    end

  end
end
