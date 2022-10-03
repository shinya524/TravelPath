class Spot < ApplicationRecord

  has_many :post_spots
  has_many :genres
  has_many :prefectures
end
