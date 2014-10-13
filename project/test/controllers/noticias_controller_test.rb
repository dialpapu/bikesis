require 'test_helper'

class NoticiasControllerTest < ActionController::TestCase
  setup do
    @noticia = noticias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:noticias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create noticia" do
    assert_difference('Noticias.count') do
      post :create, noticia: { cuerpo: @noticia.cuerpo, estadoNoticia: @noticia.estadoNoticia, fechaPublicacion: @noticia.fechaPublicacion, idGerente: @noticia.idGerente, idNoticia: @noticia.idNoticia, resumen: @noticia.resumen }
    end

    assert_redirected_to noticia_path(assigns(:noticia))
  end

  test "should show noticia" do
    get :show, id: @noticia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @noticia
    assert_response :success
  end

  test "should update noticia" do
    patch :update, id: @noticia, noticia: { cuerpo: @noticia.cuerpo, estadoNoticia: @noticia.estadoNoticia, fechaPublicacion: @noticia.fechaPublicacion, idGerente: @noticia.idGerente, idNoticia: @noticia.idNoticia, resumen: @noticia.resumen }
    assert_redirected_to noticia_path(assigns(:noticia))
  end

  test "should destroy noticia" do
    assert_difference('Noticias.count', -1) do
      delete :destroy, id: @noticia
    end

    assert_redirected_to noticias_index_path
  end
end
