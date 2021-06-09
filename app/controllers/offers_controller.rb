class OffersController < ApplicationController

  def new
    @offer = Offer.new
    @property_listing = PropertyListing.find(params[:property_listing_id])
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @property_listing = PropertyListing.find(params[:property_listing_id])
    @offer.property_listing = @property_listing

    if @offer.save
      redirect_to @property_listing, notice: "Your offer has been submitted!"
    else
      render :new
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.status = params["status"]
    @offer.save
    redirect_to @offer
  end

  private

  def offer_params
    params.require(:offer).permit(:offer_amount, :buyer_comment, :status, :seller_comment)
  end

end
