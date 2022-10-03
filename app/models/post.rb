class Post < ApplicationRecord

  belongs_to :user
  belongs_to :spot
  has_many :post_comments
  has_many :favorites

  has_one_attached :spot_image
end
