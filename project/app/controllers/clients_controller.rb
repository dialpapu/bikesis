class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @clients = Client.all
    respond_with(@clients)
  end

  def show
    respond_with(@client)
  end

  def new
    @client = Client.new
    respond_with(@client)
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.save
    respond_to do |format|
      if @index.save
        format.html { redirect_to @client, notice: 'El cliente fue creado correctamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @client.update(client_params)
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'El cliente se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to client_url, notice: 'El cliente se ha deshabilitado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:personId, :document, :personName, :lastName, :telephone, :personStatus, :birthDay, :publicity)
    end
end
