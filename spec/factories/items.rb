FactoryGirl.define do
  factory :item do
    nome {Faker::Lorem.sentence}
    referencia {Faker::Lorem.sentence}
    tipo {Faker::Lorem.sentence}
    subgrupo

  end

end