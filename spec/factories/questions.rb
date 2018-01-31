# frozen_string_literal: true
FactoryBot.define do
  factory :question do
    question_group
    title "Are you sure?"
    position 0
    answer_type 0
  end
end
