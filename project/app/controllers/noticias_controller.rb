class NoticiasController < ApplicationController
  before_action :set_noticias, only: [:show, :edit, :update, :destroy]

  def index
    @noticias = Noticias.all
    respond_with(@noticias)
  end

  def show
    respond_with(@noticias)
  end

  def new
    @noticias = Noticias.new
    respond_with(@noticias)
  end

  def edit
  end

  def create
    @noticias = Noticias.new(noticias_params)
    @noticia.save
    respond_with(@noticias)
  end

  def update
    @noticia.update(noticias_params)
    respond_with(@noticias)
  end

  def destroy
    @noticia.destroy
    respond_with(@noticias)
  end

  private
    def set_noticias
      @noticias = Noticias.find(params[:id])
    end

    def noticias_params
      params.require(:noticias).permit(:idNoticia, :idGerente, :fechaPublicacion, :cuerpo, :resumen, :estadoNoticia)
    end
end
