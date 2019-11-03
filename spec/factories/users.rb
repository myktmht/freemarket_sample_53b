FactoryBot.define do

    factory :user do
      id          {1}
      nickname    {'テストユーザー'}
      email       {'test1@example.com'}
      password    {'1234qwer'}
    end
  
  end