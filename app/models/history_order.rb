class HistoryOrder
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :address, :building, :phone_number
end