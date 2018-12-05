# frozen_string_literal: true

# == Schema Information
#
# Table name: questionnaires
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :questionnaire do
    event_instance
  end
end
