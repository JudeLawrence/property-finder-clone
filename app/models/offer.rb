class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :property_listing
  validates :buyer_comment, length: { minimum: 50 }
end
