FactoryBot.define do
  factory :item_order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '磐田市' }
    address { '123' }
    building_name { '自宅' }
    telephone_number { '00012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
