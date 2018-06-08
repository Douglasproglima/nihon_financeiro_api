FactoryGirl.define do
  factory :saldo do
    id 1
    data {Faker::Business.credit_card_expiry_date}
    saldo {Faker::Number.number(10)}
    created_at {Faker::Business.credit_card_expiry_date}
    updated_at {Faker::Business.credit_card_expiry_date}
  end

end