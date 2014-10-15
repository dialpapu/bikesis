class Bike < ActiveRecord::Base
	validates_uniqueness_of :productId, :message => "El identificador para esta persona ya existe"
validates_length_of :productReference, :within => 1..10
validates_length_of :productName, :within => 1..50
validates_length_of :productTradeMark, :within => 1..50
validates_length_of :productImage, :within => 1..100
validates_length_of :productDescription, :within => 1..300
validates_length_of :measures, :within => 1..50
validates_length_of :bikeType, :within => 1..50


end
