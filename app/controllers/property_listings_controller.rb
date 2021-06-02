class PropertyListingsController < ApplicationController

  def index
    @listings = PropertyListing.all
  end
  
  def show
    @property = PropertyListing.find(params[:id])
  end

end
