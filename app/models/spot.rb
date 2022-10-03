class Spot < ApplicationRecord

  has_many :posts
  has_many :genres
  has_many :prefectures
end
