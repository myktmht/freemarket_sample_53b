FactoryBot.define do
  factory :item do
    name                  {"testitem"}
    price                 {10000}
    description           {"testです"}
    condition             {1}
    shipping_fee          {1}
    shipping_from         {1}
    days_before_shipping  {1}
    shipping_method       {1}
    trade_status          {1}
    category_id           {1}
    user_id               {1} 
  end
end
