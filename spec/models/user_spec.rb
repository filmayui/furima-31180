require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録/ユーザー情報' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'emailがすでにデータベースに存在するものと一致した場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字未満だと登録できない' do
      @user.password = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角数字のみだと登録できない' do
      @user.password = '11111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both half-width letters and numbers. Don't type full-width.")
    end
    it 'passwordが半角英字のみだと登録できない' do
      @user.password = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both half-width letters and numbers. Don't type full-width.")
    end
    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user.password_confirmation = '2222bbbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
  describe '新規登録/本人情報確認' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@user).to be_valid
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
    end
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters.')
    end
    it 'first_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
    end
    it '生年月日が空だと登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
