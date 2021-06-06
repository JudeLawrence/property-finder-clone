class PropertyListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show, :update]

  def index
    # @listings = policy_scope(PropertyListing)

    if params[:query].present?
      @listings = policy_scope(PropertyListing).search_by_title_subtitle_and_description(params[:query])
      authorize @listings
    else
      @listings = policy_scope(PropertyListing)

    end
  end

  def show
    @marker = [{
      lat: @property.latitude,
      lng: @property.longitude,
      info_window: render_to_string(partial: "info_window", locals: { property_listing: @property })
    }]

    @listings = PropertyListing.all.limit(3)
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

  def edit

  end

  def update
    if @property.update(property_listing_params)
      redirect_to property_listing_path(@property)
    else
      render :edit
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
                                             :amenities, :year_built, :image)
  end
end
