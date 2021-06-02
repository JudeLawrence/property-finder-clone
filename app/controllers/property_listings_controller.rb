class PropertyListingsController < ApplicationController

  def index
    @listings = PropertyListing.all
  end
end
