require 'rails_helper'

RSpec.describe HistoryOrder, type: :model do
  before do
  @history_order = FactoryBot.build(:history_order)
  end

  describe '決済機能' do
    context '決済できるとき' do
      it 'すべて入力されていれば決済できること' do
        expect(@history_order).to be_valid
      end
      it '建物名を入力しても決済できること' do
        @history_order.building = "品川ビル"
        expect(@history_order).to be_valid
      end
    end

    context '決済できないとき' do
      it '郵便番号がないと決済ができない' do
        @history_order.post_number = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Post number can't be blank")
      end

      it '郵便番号にハイフンがないと決済できない' do
        @history_order.post_number = "1234567"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Post number ハイフンをつけて半角数字で入力してください")
      end

      it '郵便番号が全角だと決済できない' do
        @history_order.post_number = "１２３-４５６７"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Post number ハイフンをつけて半角数字で入力してください")
      end

      it '都道府県が選択されていないと決済できない' do
        @history_order.prefecture_id = 1
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Prefecture 都道府県を選んでください")
      end

      it '市区町村が入力されてないと決済できない' do
        @history_order.city  = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が入力されてないと決済できない' do
        @history_order.address  = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がないと決済できない' do
        @history_order.phone_number  = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が全角だと決済できない' do
        @history_order.phone_number  = "０９０１２３４５６７８"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Phone number ハイフンを抜いて11桁以内で入力してください")
      end

      it 'tokenがなければ決済できない' do
        @history_order.token  = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
