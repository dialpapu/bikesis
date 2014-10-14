class SellersController < ApplicationController
	def index
		@sellers = User.find(:all, :conditions => { :userType => 'SELLERS' })
		respond_to do |format|
			format.html
			format.pdf do
				generateReport(@sellers)
			end
		end
	end
end
