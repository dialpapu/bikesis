class Venta < ActiveRecord::Base
	validates_uniqueness_of :idVenta, :message => "El id ya existe"
	
end
