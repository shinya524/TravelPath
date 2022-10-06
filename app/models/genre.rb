class Genre < ApplicationRecord

  belongs_to :spot, optional: true
  has_many :post_spots
end
