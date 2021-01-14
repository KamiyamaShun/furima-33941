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
      it '建物名を入力しなくてもも決済できること' do
        @history_order.building = nil
        expect(@history_order).to be_valid
      end
    end

    context '決済できないとき' do
      it '郵便番号がないと決済ができない' do
        @history_order.post_number = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("郵便番号を入力してください")
      end

      it '郵便番号にハイフンがないと決済できない' do
        @history_order.post_number = '1234567'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("郵便番号をハイフンをつけて半角数字で入力してください")
      end

      it '郵便番号が全角だと決済できない' do
        @history_order.post_number = '１２３-４５６７'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("郵便番号をハイフンをつけて半角数字で入力してください")
      end

      it '都道府県が選択されていないと決済できない' do
        @history_order.prefecture_id = 1
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("都道府県を選んでください")
      end

      it '市区町村が入力されてないと決済できない' do
        @history_order.city = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が入力されてないと決済できない' do
        @history_order.address = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号がないと決済できない' do
        @history_order.phone_number = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("電話番号を入力してください")
      end

      it '電話番号が12桁だと決済できない' do
        @history_order.phone_number = '090123456789'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("電話番号をハイフンを抜いて11桁以内で入力してください")
      end

      it '電話番号が全角だと決済できない' do
        @history_order.phone_number = '０９０１２３４５６７８'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("電話番号をハイフンを抜いて11桁以内で入力してください")
      end

      it 'tokenがなければ決済できない' do
        @history_order.token = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("クレジットカード情報をを入力してください")
      end

      it 'user_idがなければ決済できない' do
        @history_order.user_id = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Userを入力してください")
      end

      it 'item_idがなければ決済できない' do
        @history_order.item_id = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
