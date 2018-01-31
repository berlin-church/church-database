# frozen_string_literal: true
FactoryBot.define do
  sequence :email do |n|
    "mario#{n}@example.com"
  end

  factory :member do
    first_name 'Mario'
    last_name 'Bros'
    gender :male
    email { generate(:email) }
  end
end
