class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :status_id
    validates :ship_fee_id
    validates :prefecture_id
    validates :ship_date_id
    validates :price
  end
  has_one_attached :image

  belongs_to :user
end
