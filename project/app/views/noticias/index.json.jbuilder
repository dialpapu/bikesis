json.array!(@noticias) do |noticia|
  json.extract! noticia, :id, :idNoticia, :idGerente, :fechaPublicacion, :cuerpo, :resumen, :estadoNoticia
  json.url noticia_url(noticia, format: :json)
end
