FactoryGirl.define do
  factory :subgrupo do
    nome {Faker::Lorem.sentence}
    grupo_conta

  end

end