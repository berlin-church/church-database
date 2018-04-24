# frozen_string_literal: true
class Event < ApplicationRecord
  has_many :event_instances

  def current_event_instance
    self.event_instances.last
  end
end
