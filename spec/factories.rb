FactoryGirl.define do

  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password "Password"
  end

  factory :question do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
  end

end
