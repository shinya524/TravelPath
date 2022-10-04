class Spot < ApplicationRecord

  has_many :post_spots
  has_many :genres
  has_many :prefectures
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
