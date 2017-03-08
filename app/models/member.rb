# frozen_string_literal: true
class Member < ApplicationRecord
  belongs_to :family
  has_one :address
  accepts_nested_attributes_for :address
  validates_format_of :first_name, :last_name, with: /\A[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end