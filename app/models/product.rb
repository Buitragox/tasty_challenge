class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
