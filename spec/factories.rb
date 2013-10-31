FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password  "password"
    password_confirmation "password"
    date_of_birth Time.gm(Random.rand(1950..2000),Random.rand(1..12),Random.rand(1..28))
  end
end