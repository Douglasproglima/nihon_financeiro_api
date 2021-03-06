FactoryGirl.define do

  factory :empresa do
    nome {Faker::Lorem.sentence(100)}
    telefone {Faker::Number.number(10)}
    email {Faker::Internet.email}
    cnpj {Faker::Number.number(14)}
    contato {Faker::Lorem.sentence(20)}
    ativo true
    user
  end

end