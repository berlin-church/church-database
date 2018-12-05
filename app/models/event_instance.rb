# frozen_string_literal: true

# == Schema Information
#
# Table name: event_instances
#
#  id               :integer          not null, primary key
#  start_time       :datetime
#  end_time         :datetime
#  address_id       :integer
#  details          :text
#  cost             :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  event_id         :integer
#  image_url        :string
#  description      :text
#  name             :string
#  questionnaire_id :integer
#

class EventInstance < ApplicationRecord
  belongs_to :address
  belongs_to :event
  has_many :attendees
  has_many :members, through: :attendees
  belongs_to :questionnaire, optional: true
  has_many :leaders

  scope :upcoming, -> { includes(:event).where('start_time >= ?', DateTime.now) }
  scope :by_event, ->(event_id) { includes(:event).where(event_id: event_id) }
  scope :upcoming, ->() { where("start_time >= ?", Time.now) }

  def name_with_date
    "#{event&.name} (#{start_time&.day}.#{start_time&.month}.#{start_time&.year})"
  end

  accepts_nested_attributes_for :leaders, allow_destroy: true
end
