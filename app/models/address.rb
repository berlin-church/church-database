# frozen_string_literal: true
class Address < ApplicationRecord
  belongs_to :member

  # validates :city, with: /^[A-Za-z]+$/
  validates :street, :city, :zip_code, presence: true

  def display_name
    "#{street} #{street_number}, #{city}"
  end
end
