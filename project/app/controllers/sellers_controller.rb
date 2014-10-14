class SellersController < ApplicationController
	def index
		#@sellers = User.find(:all, :conditions => { :userType => 'Seller' })
		@sellers = User.where(:userType => 'Seller')
		respond_to do |format|
			format.html
			format.pdf do
				generateReport(@sellers)
			end
		end
	end
	private
	def set_seller
		@seller = User.find(params[:id])
	end

	def seller_params
		params.require(:seller).permit(:id,:username, :userLastName,:document,:telephone, :userType, :status)

	end
end
