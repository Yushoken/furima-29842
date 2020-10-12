FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.email }
    password {'test11'}
    password_confirmation {password}
    first_name { '名前' }
    last_name {'苗字'}
    first_name_kana {'ナマエ'}
    last_name_kana {'ミョウジ'}
    birth_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
  end
end
