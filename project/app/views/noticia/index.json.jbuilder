json.array!(@noticia) do |noticium|
  json.extract! noticium, :id, :idNoticia, :idGerente, :fechaPublicacion, :cuerpo, :resumen, :estadoNoticia
  json.url noticium_url(noticium, format: :json)
end
