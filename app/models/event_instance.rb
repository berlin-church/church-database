# frozen_string_literal: true
class EventInstance < ApplicationRecord
  belongs_to :address
  belongs_to :event
  has_many :attendees
  has_many :members, through: :attendees

  scope :upcoming, -> { includes(:event).where("start_time > ?", DateTime.now) }
  scope :by_event, ->(event_id) { includes(:event).where(event_id: event_id) }

  def name
    "#{event&.name} #{self.start_time.month}/#{self.start_time.year}"
  end
end
