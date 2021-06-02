class PropertyListingsController < ApplicationController

  def show
    @property = PropertyListing.find(params[:id])
  end

end
