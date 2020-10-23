require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end
  describe '購入情報登録' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@user_order).to be_valid
    end
    it 'buildingが空でも登録できる' do
      @user_order.building = ''
      expect(@user_order).to be_valid
    end
    it 'postal_codeが空だと登録できない' do
      @user_order.postal_code = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフン(-)がないと登録できない' do
      @user_order.postal_code = '0000000'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idが0だと登録できない' do
      @user_order.prefecture_id = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it 'cityが空だと登録できない' do
      @user_order.city = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressesが空だと登録できない' do
      @user_order.addresses = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Addresses can't be blank")
    end
    it 'phone_numberが空だと登録できない' do
      @user_order.phone_number = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数字でないと登録できない' do
      @user_order.phone_number = 'あああああ'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is invalid. Please type half-width number")
    end
    it 'tokenが空だと登録できない' do
      @user_order.token = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end