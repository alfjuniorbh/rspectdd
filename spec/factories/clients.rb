FactoryBot.define do
  factory :client do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    phone {Faker::PhoneNumber.phone_number}
    smoker {['Y', 'N'].sample}
    avatar {"#{Rails.root}/spec/fixtures/avatar.png"}
  end
end
