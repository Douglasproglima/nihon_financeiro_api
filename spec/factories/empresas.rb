FactoryGirl.define do
  factory :empresa do
    id 1
    nome {Faker::Lorem.sentence(100)}
    telefone {Faker::Number.number(10)}
    email {Faker::Internet.email}
    cnpj {Faker::Number.number(14)}
    contato {Faker::Lorem.sentence(20)}
    ativo true
    created_at {Faker::Business.credit_card_expiry_date}
    updated_at {Faker::Business.credit_card_expiry_date}
    user "1"

  end

end