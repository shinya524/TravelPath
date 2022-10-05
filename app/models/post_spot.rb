class PostSpot < ApplicationRecord

  belongs_to :user
  belongs_to :spot, optional: true
  has_many :genre, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_one_attached :spot_image

  def get_spot_image(width, height)
    unless spot_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      spot_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    spot_image.variant(resize_to_limit: [width, height]).processed
  end
end
