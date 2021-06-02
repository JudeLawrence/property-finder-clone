class PropertyListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @listings = PropertyListing.all
  end
  
  def show
    @property = PropertyListing.find(params[:id])
  end

end
