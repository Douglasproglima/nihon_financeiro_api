FactoryGirl.define do
  factory :item do
    id 1
    nome {Faker::Lorem.sentence}
    referencia {Faker::Lorem.sentence}
    tipo {Faker::Lorem.sentence}
    created_at {Faker::Business.credit_card_expiry_date}
    updated_at {Faker::Business.credit_card_expiry_date}
    subgrupo "1"

  end

end