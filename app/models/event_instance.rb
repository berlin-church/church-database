# frozen_string_literal: true
class EventInstance < ApplicationRecord
  belongs_to :address
  belongs_to :event
end
