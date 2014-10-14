class SellersController < ApplicationController
	def index
		@sellers = User.all
		respond_to do |format|
			format.html
			format.pdf do
				generateReport(@sellers)
			end
		end
	end
end
