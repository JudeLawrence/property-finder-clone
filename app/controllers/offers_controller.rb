class OffersController < ApplicationController

  def new
    @offer = Offer.new
    @property_listing = PropertyListing.find(params[:property_listing_id])
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.property_listing = PropertyListing.find(params[:property_listing_id])
    if @offer.save
      redirect_to property_listings_path
    else
      # Do something if not validated
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:offer_amount, :buyer_comment)
  end
end
