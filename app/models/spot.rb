class Spot < ApplicationRecord

  has_many :post_spots, dependent: :destroy
  has_many :genres

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
