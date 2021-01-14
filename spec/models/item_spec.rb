require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
      it 'すべてを入力すれば登録できる' do
        expect(@item).to be_valid
      end

      it '300円以上であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it '9,999,999円以下であれば登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '商品登録できないとき' do
      it '出品画像がなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("写真を入力してください")
      end

      it '商品名がなければ登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明がなければ登録できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーが入力されてなければ登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it '商品の状態が入力されてなければ登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it '配送料の負担が入力されていなければ登録できない' do
        @item.ship_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it '発送元の地域が入力されてなければ登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it '発送までの日数が入力されてなければ登録できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '金額が入力されてなければ登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を半角数字で入力してください")
      end

      it '金額が300円未満なら登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を半角数字で入力してください")
      end

      it '金額が10,000,000以上なら登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を半角数字で入力してください")
      end

      it '金額が全角数字なら登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を半角数字で入力してください")
      end
    end
  end
end
