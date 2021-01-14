require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できるとき' do
      it 'コメントに文字を入力すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが投稿できないとき' do
      it 'コメントが空では投稿できない' do
        @comment.comment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
    end
  end
end
