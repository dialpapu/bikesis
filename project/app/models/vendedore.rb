class Vendedore < ActiveRecord::Base
	validates_uniqueness_of :idPersona, :message => "El id ya existe"
	validates_uniqueness_of :documento, :message => "El documento ya existe"
	#validates_uniqueness_of :eMail, :message => "El documento ya existe"
end
