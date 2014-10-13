class Noticia < ActiveRecord::Base
	validates_uniqueness_of :idNoticia, :message => "El id ya existe"
end
