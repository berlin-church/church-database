# frozen_string_literal: true
class Member < ApplicationRecord
  belongs_to :family
  has_one :address
  accepts_nested_attributes_for :address
  validates_format_of :first_name, :last_name, with: /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :email, allow_blank: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
