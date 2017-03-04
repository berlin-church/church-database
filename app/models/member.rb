# frozen_string_literal: true
class Member < ApplicationRecord
  belongs_to :family
  has_one :address
  accepts_nested_attributes_for :address
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
end
