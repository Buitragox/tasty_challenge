require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    expect(build(:product)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:product, name: nil)).to be_invalid
  end

  it 'is invalid with names longer than 255 characters' do
    expect(build(:product, name: 'a' * 256)).to be_invalid
  end

  it 'is invalid without a stock' do
    expect(build(:product, stock: nil)).to be_invalid
  end

  it 'is invalid with a negative stock' do
    expect(build(:product, stock: Integer(Faker::Number.negative))).to be_invalid
  end

  it 'is invalid with a non-integer stock' do
    expect(build(:product, stock: Faker::Number.positive)).to be_invalid
  end

  it 'is invalid without a price' do
    expect(build(:product, price: nil)).to be_invalid
  end

  it 'is invalid with a negative price' do
    expect(build(:product, price: Faker::Number.negative)).to be_invalid
  end
end
