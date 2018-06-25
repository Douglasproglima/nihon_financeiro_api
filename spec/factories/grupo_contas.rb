FactoryGirl.define do
  factory :grupo_conta do
    nome {Faker::Lorem.sentence}
    referencia {Faker::Number.decimal}
    # created_at {Faker::Business.credit_card_expiry_date}
    # updated_at {Faker::Business.credit_card_expiry_date}
  end
end