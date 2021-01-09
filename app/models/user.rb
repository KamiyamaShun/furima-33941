class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
  end

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '英数字混合で入力してください' } do
    validates :password
  end

  validates :birth, presence: true
  validates :nickname, presence: true
end
