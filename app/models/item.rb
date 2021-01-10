class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name
    validates :info
    validates :image
  end

  with_options numericality:{greater_than: 299, less_than: 100000000, message: '半角数字で入力してください'} do
    validates :price
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :ship_fee_id
    validates :prefecture_id
    validates :ship_date_id
  end

  has_one_attached :image

  belongs_to :user

  belongs_to :category
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :prefecture
  belongs_to :ship_date
end
