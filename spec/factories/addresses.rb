# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  street        :string
#  street_number :string
#  zip_code      :string
#  city          :string
#  country       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  member_id     :integer
#

FactoryBot.define do
  factory :address do
    member
    street "Schutzenstrasse"
    city "berlin"
  end
end
