FactoryBot.define do
  factory :history_order do
    post_number { '123-4567' }
    prefecture_id { 2 }
    city { '品川' }
    address { '品川１丁目' }
    building {'品川ビル'}
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id {1}
    item_id {2}
  end
end
