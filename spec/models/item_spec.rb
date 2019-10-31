require 'rails_helper'

describe Item do

  describe 'POST #create'do
    let(:item) { create(:item) }
  
    it 'is valid with colums' do
      item = build(:item)
      expect(item).to be_valid
    end

    it 'is invalid without name' do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name])
    end

    it 'is invalid without price' do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price])
    end

    it 'is invalid without description' do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description])
    end

    it 'is invalid without condition' do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition])
    end

    it 'is invalid without shipping_fee' do
      item = build(:item, shipping_fee: nil)
      item.valid?
      expect(item.errors[:shipping_fee])
    end

    it 'is invalid without shipping_from' do
      item = build(:item, shipping_from: nil)
      item.valid?
      expect(item.errors[:shipping_from])
    end

    it 'is invalid without days_before_shipping' do
      item = build(:item, days_before_shipping: nil)
      item.valid?
      expect(item.errors[:days_before_shipping])
    end

    it 'is invalid without shipping_method' do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method])
    end

    it 'is invalid without trade_status' do
      item = build(:item, trade_status: nil)
      item.valid?
      expect(item.errors[:trade_status])
    end

    it 'is invalid without user_id' do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id])
    end

    it 'is invalid without category_id' do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id])
    end
  end
end