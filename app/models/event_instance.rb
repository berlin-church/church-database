# frozen_string_literal: true
class EventInstance < ApplicationRecord
  belongs_to :address
  belongs_to :event
  has_many :attendees
  has_many :members, through: :attendees

  def name
    "#{event&.name} #{self.start_time.month}/#{self.start_time.year}"
  end
end
