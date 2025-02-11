class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 150 }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.001 }, format: { with: /\A\d+(\.\d{1,3})?\z/ }

  def as_json(options = {})
    super(options.merge(except: %i[updated_at]))
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id name stock price created_at updated_at]
  end
end
