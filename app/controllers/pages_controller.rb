class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @listings = PropertyListing.all.limit(6)
  end
end
