require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'すべてを入力したときユーザー新規登録ができる' do
      @user.valid?
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'すでに登録されたemailでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordがなければ登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字では登録ができない' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwaordが数字のみでは登録ができない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 英数字混合で入力してください')
    end

    it 'passwaordが英語のみでは登録ができない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 英数字混合で入力してください')
    end

    it 'password_confirmationがなければ登録ができない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '誕生日が入力されていなければ登録できない' do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

    it 'お名前が半角英数字であれば登録できない' do
      @user.family_name = 'aa1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
    end

    it 'お名前（カナ）がひらがなであれば登録できない' do
      @user.family_name_kana = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana 全角カナ文字を使用してください')
    end

    it 'お名前（カナ）が漢字であれば登録できない' do
      @user.family_name_kana = '嗚呼'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana 全角カナ文字を使用してください')
    end

    it 'お名前（カナ）が半角英数字であれば登録できない' do
      @user.family_name_kana = 'aa1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana 全角カナ文字を使用してください')
    end

    it 'emailに＠がなければ登録できない' do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc124'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
