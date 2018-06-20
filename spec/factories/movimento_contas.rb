FactoryGirl.define do
  factory :movimento_conta do
    id 1
    data {Faker::Business.credit_card_expiry_date}
    centro_custo {Faker::Lorem.sentence}
    valor {Faker::Number.number(10)}
    saldo_anterior {Faker::Number.number(10)}
    tipo {Faker::Lorem.sentence}
    created_at {Faker::Business.credit_card_expiry_date}
    updated_at {Faker::Business.credit_card_expiry_date}
    conta "1"
    user "1"
    movimento_id "1"

  end

end