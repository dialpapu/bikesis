class Equipacione < ActiveRecord::Base
	validates_uniqueness_of :idProducto, :message => "El id ya existe"
end
