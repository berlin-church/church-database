class Attendee < ApplicationRecord
  belongs_to :member
  belongs_to :event_instance
end
