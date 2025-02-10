require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    expect(build(:product)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:product, name: nil)).to be_invalid
    expect(build(:product, name: '   ')).to be_invalid
  end

  it 'is invalid with a name shorter than 3 characters' do
    expect(build(:product, name: 'aa')).to be_invalid
  end

  it 'is invalid with names longer than 150 characters' do
    expect(build(:product, name: 'a' * 151)).to be_invalid
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

  it 'is invalid with a non-positive price' do
    expect(build(:product, price: 0)).to be_invalid
    expect(build(:product, price: Faker::Number.negative)).to be_invalid
  end

  it 'is invalid when price has more than 3 decimals' do
    expect(build(:product, price: '0.1234')).to be_invalid
  end

  it 'is valid with a positive price with up to 3 decimal digits' do
    expect(build(:product, price: Faker::Number.positive.round(3))).to be_valid
    expect(build(:product, price: '50000.25')).to be_valid
    expect(build(:product, price: '10000.999')).to be_valid
    expect(build(:product, price: '0.999')).to be_valid
    expect(build(:product, price: '1234567890')).to be_valid
  end
end
