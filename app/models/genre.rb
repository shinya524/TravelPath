class Genre < ApplicationRecord

  belongs_to :spot, optional: true
  belongs_to :post_spot
end
