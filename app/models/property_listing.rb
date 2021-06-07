class PropertyListing < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :image

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model

  pg_search_scope :search_by_title_subtitle_and_description,
    against: [ :title, :sub_title, :description, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
