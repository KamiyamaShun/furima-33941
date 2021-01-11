require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it 'すべてを入力したときユーザー新規登録ができる' do
        expect(@user).to be_valid
      end

      it 'パスワードが6文字以上であれば登録ができる' do
        @user.password = 'abc1234'
        @user.password_confirmation = 'abc1234'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない場合' do
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

      it 'passwordが数字のみでは登録ができない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英数字混合で入力してください')
      end

      it 'passwordが英語のみでは登録ができない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英数字混合で入力してください')
      end

      it 'passworは全角では登録ができない' do
        @user.password = 'あいうえおか'
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

      it 'お名前（全角）が半角英数字であれば登録できない' do
        @user.family_name = 'aa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end

      it 'お名前（全角）が半角英数字であれば登録できない' do
        @user.first_name = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'お名前（全角）が空欄であれば登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'お名前（全角）が空欄であれば登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'お名前（カナ）がひらがなであれば登録できない' do
        @user.family_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana 全角カナ文字を使用してください')
      end

      it 'お名前（カナ）がひらがなであれば登録できない' do
        @user.first_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カナ文字を使用してください')
      end

      it 'お名前（カナ）が漢字であれば登録できない' do
        @user.family_name_kana = '嗚呼'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana 全角カナ文字を使用してください')
      end

      it 'お名前（カナ）が漢字であれば登録できない' do
        @user.first_name_kana = '嗚'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カナ文字を使用してください')
      end

      it 'お名前（カナ）が空欄であれば登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'お名前（カナ）が空欄であれば登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'お名前（カナ）が半角英数字であれば登録できない' do
        @user.family_name_kana = 'aa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana 全角カナ文字を使用してください')
      end

      it 'お名前（カナ）が半角英数字であれば登録できない' do
        @user.first_name_kana = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カナ文字を使用してください')
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
end
