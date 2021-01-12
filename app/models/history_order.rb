class HistoryOrder
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフンをつけて半角数字で入力してください。"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "ハイフンを抜いて11桁以内で入力してください。"}
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "都道府県を選んでください。" }

  def save
    history = History.create(user_id: current_user.id, item_id: params[:item_id])
    Order.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, history_id: history.id)
  end
end