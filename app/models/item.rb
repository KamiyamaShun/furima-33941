class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name
    validates :info
    validates :image
  end

  with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を半角数字で入力してください' } do
    validates :price
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :status_id
    validates :ship_fee_id
    validates :prefecture_id
    validates :ship_date_id
  end

  has_one_attached :image

  belongs_to :user
  has_one :history
  has_many :comments, dependent: :destroy

  belongs_to :category
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :prefecture
  belongs_to :ship_date
end
