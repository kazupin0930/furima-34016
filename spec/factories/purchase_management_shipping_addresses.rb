FactoryBot.define do
  factory :purchase_management_shipping_address do
    postal_code { '123-0001' }
    shipping_area_id { '2' }
    municipality { '横浜市' }
    address { '青山1-1' }
    building_name { '青山ビル' }
    phone_number { '09012341234' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
