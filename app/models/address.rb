# frozen_string_literal: true
class Address < ApplicationRecord
  belongs_to :member

  # validates :city, with: /^[A-Za-z]+$/
end
