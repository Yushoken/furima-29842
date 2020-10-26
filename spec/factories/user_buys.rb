FactoryBot.define do
  factory :user_buy do
    token {'tok_abcdefghijk00000000000000000'}
    postal_code {'123-4567'}
    city { '東京都' }
    addresses { '1-1' }
    building { '東京ハイツ' }
    phone_number {'09012345678'}
    prefecture_id {2}
  end
end
