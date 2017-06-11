# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:zip_code) }
end
