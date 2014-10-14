class ElementDrawer
	def self.draw(elements)
		pdf = PDF::Writer.new
		@elements.each	do |element|
			pdf.text element.productName	
		end
		pdf.render
	end
end