FactoryGirl.define do
  factory :grupo_conta do
    nome {Faker::Lorem.sentence}
    referencia {Faker::Number.decimal}
  end
end