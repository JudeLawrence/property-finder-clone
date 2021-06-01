class CreatePropertyListings < ActiveRecord::Migration[6.1]
  def change
    create_table :property_listings do |t|
      t.string :title
      t.string :sub_title
      t.text :description
      t.string :location
      t.string :property_type
      t.float :listing_price
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.integer :property_size
      t.integer :number_of_parking_spaces
      t.jsonb :amenities
      t.integer :year_built
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
