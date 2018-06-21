FactoryGirl.define do
  factory :conta do
    nome {Faker::Lorem.sentence}
    numero {Faker::Lorem.sentence}
    agencia {Faker::Lorem.sentence}
    saldo {Faker::Number.decimal}
    saldo_inicial {Faker::Number.decimal}
    created_at {Faker::Business.credit_card_expiry_date}
    updated_at {Faker::Business.credit_card_expiry_date}
    user

  end

end