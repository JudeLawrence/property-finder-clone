class PropertyListingsController < ApplicationController

  before_action :set_listing, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listings = policy_scope(PropertyListing)
  end
  
  def show
  end

  private

  def set_listing
    @property = PropertyListing.find(params[:id])
    authorize @property
  end

end
