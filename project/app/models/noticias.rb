class Noticias < ActiveRecord::Base
	validates_uniqueness_of :idNoticia, :message => "El id ya existe"
end
