FactoryBot.define do
  factory :customer do
    name "Sr. #{Faker::Name.name}"
    email Faker::Internet.email
  end
 end