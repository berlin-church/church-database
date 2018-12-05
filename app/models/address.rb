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
