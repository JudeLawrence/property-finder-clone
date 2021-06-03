class PropertyListingsController < ApplicationController

  before_action :set_listing, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listings = policy_scope(PropertyListing)
  end

  def show
    @marker = {
      lat: @property.latitude,
      lng: @property.longitude
    }
  end

  def new
    @property_listing = PropertyListing.new
    authorize @property_listing
  end

  def create
    @property_listing = PropertyListing.new(property_listing_params)
    @property_listing.user = current_user
    authorize @property_listing
    if @property_listing.save
      redirect_to property_listing_path(@property_listing)
    else
      render 'new'
    end
  end

  private

  def set_listing
    @property = PropertyListing.find(params[:id])
    authorize @property
  end

  def property_listing_params
    params.require(:property_listing).permit(:title, :sub_title, :description,
                                             :location, :property_type, :listing_price, :number_of_bedrooms,
                                             :number_of_bathrooms, :number_of_parking_spaces, :property_size,
                                             :amenities, :year_built)
  end
end
