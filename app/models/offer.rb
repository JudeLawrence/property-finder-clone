class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :property_listing
  validates :buyer_comment, length: { maximum: 50 }
end
