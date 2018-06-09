# frozen_string_literal: true
class EventInstance < ApplicationRecord
  belongs_to :address
  belongs_to :event
  has_many :attendees
  has_many :members, through: :attendees
  has_many :questionnaires
  has_many :leaders

  scope :upcoming, -> { includes(:event).where('start_time >= ?', DateTime.now) }
  scope :by_event, ->(event_id) { includes(:event).where(event_id: event_id) }
  scope :upcoming, ->() { where("start_time >= ?", Time.now) }

  def name
    "#{event&.name} (#{start_time&.day}.#{start_time&.month}.#{start_time&.year})"
  end

  accepts_nested_attributes_for :leaders, allow_destroy: true
end
