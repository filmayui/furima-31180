require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/camera.png')
  end
  describe '商品出品' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@item).to be_valid
    end
    it 'nameが空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'priceが空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'textが空だと登録できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'category_idが0だと登録できない' do
      @item.category_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it 'sales_status_idが0だと登録できない' do
      @item.sales_status_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status must be other than 0")
    end
    it 'shopping_fee_status_idが0だと登録できない' do
      @item.shopping_fee_status_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping fee status must be other than 0")
    end
    it 'prefecture_idが0だと登録できない' do
      @item.prefecture_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it 'scheduled_delivery_idが0だと登録できない' do
      @item.scheduled_delivery_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 0")
    end
    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '販売価格の範囲が¥300~¥9999999の間でないと登録できない' do
      @item.price = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '販売価格が半角数字でないと登録できない' do
      @item.price = '３３３'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end
