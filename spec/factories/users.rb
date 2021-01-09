FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    family_name           { 'ああ' }
    first_name            { 'あ' }
    family_name_kana      { 'アア' }
    first_name_kana       { 'ア' }
    birth                 { 1930 - 1 - 1 }
    email                 { 'test@example' }
    password              { 'abc123' }
    password_confirmation { password }
  end
end
