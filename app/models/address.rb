# frozen_string_literal: true
class Address < ApplicationRecord
  belongs_to :member

  # validates :city, with: /^[A-Za-z]+$/
  validates :street, :city, presence: true

  def display_name
    if defined?(street_number).nil?
      "#{street} #{street_number}, #{city}"
    else
      "#{street}, #{city}"
    end
  end
end
