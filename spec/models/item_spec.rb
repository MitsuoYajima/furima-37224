require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'image、title、explanation、category_id、condition_id、delivery_charge_id、prefecture_id、days_to_ship_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では出品出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'titleが空では出品出来ない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it 'explanationが空では出品出来ない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが1では出品出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが1では出品出来ない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'delivery_charge_idが1では出品出来ない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it 'prefecture_idが1では出品出来ない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'days_to_ship_idが1では登録出来ない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'priceが空では登録出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが半角数字以外では登録出来ない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが300円未満では出品出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 299"
      end
      it 'priceが9999999円を超えると出品出来ない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than 10000000"
      end
      it 'userが紐付いていないと出品出来ない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end