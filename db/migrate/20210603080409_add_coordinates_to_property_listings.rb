class AddCoordinatesToPropertyListings < ActiveRecord::Migration[6.1]
  def change
    add_column :property_listings, :latitude, :float
    add_column :property_listings, :longitude, :float
  end
end
