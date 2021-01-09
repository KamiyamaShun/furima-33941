require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "すべて入力したら登録ができる" do
    end

    it "nicknameが空では登録できない" do
    end

    it "emailが空では登録できない" do
    end

    it "すでに登録されたemailでは登録できない" do
    end

    it "passwordがなければ登録できない" do
    end

    it "passwordが5文字では登録ができない" do
    end

    it "passwaordが数字のみでは登録ができない" do
    end

    it "password_confirmationがなければ登録ができない" do
    end

    it "passwaordが数字のみでは登録ができない" do
    end

  end

  describe 'ユーザーログイン'
    it "すべて入力したらログインができる" do
    end

    it "emailが空では登録ができない" do
    end

    it "passwordが空では登録できない" do
    end
end
