class Equipment < ActiveRecord::Base
	validates_uniqueness_of :productId, :message => "El identificador para esta persona ya existe"
	validates_length_of :productReference, :within => 1..10
	validates_length_of :productName, :within => 1..50
	validates_length_of :productTradeMark, :within => 1..50
	validates_length_of :productDescription, :within => 1..300
	validates_length_of :size, :within => 1..2
	validates_length_of :gender, :within => 1..1
	validates_presence_of :image , :message => " Debes subir una imagen"

	has_attached_file :image
	validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
	
	def equipment_params
		params.require(:equipment).permit(:productId, :productReference, :productName, :productTradeMark, :productPrice, :productStatus, :productDescription, :size, :gender, :image)
	end
end
