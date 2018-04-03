# frozen_string_literal: true
FactoryBot.define do
  factory :admin_user do
    sequence(:email) { |n| "user#{n}@berlin.church" }
    password "123456"
  end
end
