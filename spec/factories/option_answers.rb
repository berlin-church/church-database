# frozen_string_literal: true

# == Schema Information
#
# Table name: option_answers
#
#  id                 :integer          not null, primary key
#  question_option_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  attendee_id        :integer
#

FactoryBot.define do
  factory :option_answer do
    member
    question_option
  end
end
