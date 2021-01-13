FactoryBot.define do
  factory :history_order do
    post_number { '123-4567' }
    prefecture_id { 2 }
    city { '品川' }
    address { '品川１丁目' }
    building {}
    phone_number { '09012345678' }
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
