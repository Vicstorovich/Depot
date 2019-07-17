class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :menus

  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true

  mount_uploader :image, ImageUploader
end
