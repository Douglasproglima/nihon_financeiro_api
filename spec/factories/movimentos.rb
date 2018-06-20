FactoryGirl.define do
  factory :movimento do
    id 1
    data {Faker::Business.credit_card_expiry_date}
    centro_custo {Faker::Lorem.sentence}
    valor {Faker::Number.number(10)}
    observacao {Faker::Lorem.sentence}
    tipo {Faker::Lorem.sentence}
    created_at {Faker::Business.credit_card_expiry_date}
    updated_at {Faker::Business.credit_card_expiry_date}
    item "1"
    conta "1"
    user "1"

  end

end