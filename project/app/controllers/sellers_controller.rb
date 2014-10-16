class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  
  before_filter :authenticate_user!
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

def show
  @sales = Sale.where(:sellerId => @seller.personId)
end

def new
  @seller = Seller.new

end

def edit

end

def create
  @seller = Seller.new(seller_params)
  if User.all.nil?
    @seller.personId=1
  else
    @seller.personId= User.all.count+1
  end
  @seller.userType='Seller'
  @seller.status='true'
  @seller.password = "#{@seller.username}.#{@seller.userLastName}"
  @user  =  User.new(
    :personId => @seller.personId,
    :username => @seller.username,
    :email =>  @seller.email , 
    :userLastName =>@seller.userLastName,
    :document => @seller.document,
    :telephone => @seller.telephone,
    :userType => @seller.userType,
    :status => @seller.status,
    :password =>  @seller.password,
    :password_confirmation => @seller.password)
  @user.save 
  respond_to do |format|
    if @user.save
      format.html { redirect_to @seller, notice: 'Vendedor creado correctamente.' }
      format.json { render :show, status: :created, location: @seller }
    else
      format.html { render :new }
      format.json { render json: @seller.errors, status: :unprocessable_entity }
    end
  end

end

def update
@sellers = User.where(:userType => 'Seller')
 @user = User.where(:personId => @seller.personId)
  @seller  =  User.update(2,
    :username => @seller.username,
    :email =>  @seller.email , 
    :userLastName =>@seller.userLastName,
    :document => @seller.document,
    :telephone => @seller.telephone)
  @seller.save 
  respond_to do |format|
    if @seller.save
      format.html { redirect_to root_path, notice: 'Vendedor actualizado correctamente.' }
      format.json { render :show, status: :created, location: @seller }
    else
      format.html { render :new }
      format.json { render json: @seller.errors, status: :unprocessable_entity }
    end
  end

end

def destroy
  #@seller.destroy
  respond_to do |format|
   if @seller.status==true
    format.html { redirect_to sellers_url, notice: 'El Vendedor ha sido deshabilitado.' }
    query="update users set status = 0 where personId="+@seller.personId.to_s
    @users=ActiveRecord::Base.connection.execute(query)
  else
    format.html { redirect_to sellers_url, notice: 'El Vendedor ha sido habilitado.' }
    query="update users set status = 1 where personId="+@seller.personId.to_s
    @users=ActiveRecord::Base.connection.execute(query)
  end
  format.json { head :no_content }
end

end

private
def set_seller
  aux_seller = User.find(params[:id])
  @seller  =  Seller.new(
    :personId => aux_seller.personId,
    :username => aux_seller.username,
    :email =>  aux_seller.email , 
    :userLastName =>aux_seller.userLastName,
    :document => aux_seller.document,
    :telephone => aux_seller.telephone,
    :userType => aux_seller.userType,
    :status => aux_seller.status,
    :password =>  aux_seller.password,
    :password_confirmation => aux_seller.password)

end

def seller_params
  params.require(:seller).permit(:personId, :document, :username, :userLastName, :email, :password, :telephone, :userType, :status)
end
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
