class CatalogController < ApplicationController
  def index
  	@bikes = Bike.all
  end
end
