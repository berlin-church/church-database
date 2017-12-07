# frozen_string_literal: true
class EventInstance < ApplicationRecord
  belongs_to :address
  belongs_to :event

  def name
    "#{event.name} #{self.start_time.month}/#{self.start_time.year}"
  end
end
