class Seller < ActiveRecord::Base
	def dataSellers
		"#{document}: #{username}  #{userLastName}"
	end
end
