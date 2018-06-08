FactoryGirl.define do
  factory :contas do
    id 1
    nome {Faker::Lorem.sentence}
    numero {Faker::Lorem.sentence}
    agencia {Faker::Lorem.sentence}
    saldo {Faker::Number.number(10)}
    saldo_inicial {Faker::Number.number(10)}
    created_at {Faker::Business.credit_card_expiry_date}
    updated_at {Faker::Business.credit_card_expiry_date}
    user "1"

  end

end