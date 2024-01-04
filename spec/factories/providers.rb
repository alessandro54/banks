FactoryBot.define do
  factory :provider do
    name { Faker::Company.name }
    nit { "901362343-4" }
    contact_name { Faker::Name.name }
    contact_phone { "1234567890" }



    bank
  end
end
