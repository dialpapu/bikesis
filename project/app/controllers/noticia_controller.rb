class NoticiaController < ApplicationController
  before_action :set_noticium, only: [:show, :edit, :update, :destroy]

  def index
    @noticia = Noticium.all
    respond_with(@noticia)
  end

  def show
    respond_with(@noticium)
  end

  def new
    @noticium = Noticium.new
    respond_with(@noticium)
  end

  def edit
  end

  def create
    @noticium = Noticium.new(noticium_params)
    @noticium.save
    respond_with(@noticium)
  end

  def update
    @noticium.update(noticium_params)
    respond_with(@noticium)
  end

  def destroy
    @noticium.destroy
    respond_with(@noticium)
  end

  private
    def set_noticium
      @noticium = Noticium.find(params[:id])
    end

    def noticium_params
      params.require(:noticium).permit(:idNoticia, :idGerente, :fechaPublicacion, :cuerpo, :resumen, :estadoNoticia)
    end
end
