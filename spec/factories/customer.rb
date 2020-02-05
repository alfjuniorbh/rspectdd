FactoryBot.define do
  factory :customer do
    name { "Sr. #{Faker::Name.name}" }
    email { Faker::Internet.email }

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    factory :customer_default do
      vip { false }
      days_to_pay { 20 }
    end

  end
 end