# frozen_string_literal: true
FactoryGirl.define do
  sequence :email do |n|
    "mario#{n}@example.com"
  end

  factory :member do
    first_name 'Mario'
    last_name 'Bros'
    gender :male
    password '123456'
    email { generate(:email) }
  end
end
