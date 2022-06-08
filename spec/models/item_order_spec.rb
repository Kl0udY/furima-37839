require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before '購入情報の保存' do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '情報を保存できる場合' do
      it 'user_id、item_id、postal_code、prefecture_id、municipalities、address、telephone_number、tokenが存在すれば保存できる' do
        expect(@item_order).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @item_order.building_name = ''
        expect(@item_order).to be_valid
      end
    end
    context '情報を保存できない場合' do
      it 'postal_codeが空では保存できない' do
        @item_order.postal_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「半角数字3桁+ハイフン+半角数字4桁」でなければ保存できない' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空では保存できない' do
        @item_order.prefecture_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1(「---」を選択)では保存できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalitiesが空では保存できない' do
        @item_order.municipalities = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では保存できない' do
        @item_order.address = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では保存できない' do
        @item_order.telephone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが「半角数字9桁以下」では保存できない' do
        @item_order.telephone_number = '000123456'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが「半角数字12桁以上」では保存できない' do
        @item_order.telephone_number = '000123456789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberに半角数字以外が含まれている場合は保存できない' do
        @item_order.telephone_number = 'あ0001234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'tokenが空では保存できない' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ保存できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ保存できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
