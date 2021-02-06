FactoryBot.define do
  factory :item do
    item_name { 'パソコン' }
    description { 'すごく貴重なもの' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    shipping_area_id { 33 }
    day_to_ship_id { 2 }
    price { 2222 }
    seller_id { 2 }
    buyer_id { 2 }
    
    association :user

    
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/images/pokemon.png'), filename: 'pokemon.png')
    end
  end
end