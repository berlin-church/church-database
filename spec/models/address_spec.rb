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

require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:city) }
end
