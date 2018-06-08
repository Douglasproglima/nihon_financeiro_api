FactoryGirl.define do
  factory :subgrupo do
    id 1
    nome {Faker::Lorem.sentence}
    referencia {Faker::Lorem.sentence}
    created_at {Faker::Business.credit_card_expiry_date}
    updated_at {Faker::Business.credit_card_expiry_date}
    grupo_conta "1"

  end

end