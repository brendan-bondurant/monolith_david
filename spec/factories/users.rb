FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' } 
    password_confirmation { 'password' } 
    id {Faker::Number.non_zero_digit}
    phone {"1234567890"} 
    address {"123 main street"} 
    name {"user"}
  end
end
