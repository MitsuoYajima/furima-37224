require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'token, post_code、prefecture_id、municipality、address,building_name,phone_numberが存在すれば登録できる' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'tokenが空では出品出来ない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end
      it 'post_codeが空では出品出来ない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeが「3桁ハイフン4桁」でないと出品出来ない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include "Post code Input Correctly"
      end      
      it 'prefecture_idが1では出品出来ない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalityが空では登録出来ない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'addressが空では登録出来ない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では登録出来ない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが10桁以上11桁以内の半角数値でないと登録出来ない' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number Input only number"
      end
      it 'phone_numberが9桁以下では登録出来ない' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is too short"
      end
      it 'phone_numberが12桁以上では登録出来ない' do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is too long"
      end
      it 'userが紐付いていないと出品出来ない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと出品出来ない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
