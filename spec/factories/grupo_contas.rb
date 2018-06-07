FactoryGirl.define do
  factory :grupo_conta do
    id 1
    nome {Faker::Lorem.sentence}
    referencia {Faker::Number.number(10)}
    created_at {Faker::Business.credit_card_expiry_date}
    updated_at {Faker::Business.credit_card_expiry_date}
  end

end