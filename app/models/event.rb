# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_url   :string
#  is_visible  :boolean
#

class Event < ApplicationRecord
  has_many :event_instances

  def current_event_instance
    self.event_instances.last
  end
end
