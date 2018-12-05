# frozen_string_literal: true

# == Schema Information
#
# Table name: leaders
#
#  id                :integer          not null, primary key
#  member_id         :integer
#  event_instance_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :leader do
    event_instance
    member
  end
end
