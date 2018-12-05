# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  question_group_id :integer
#  title             :string
#  position          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  answer_type       :integer
#

FactoryBot.define do
  factory :question do
    question_group
    title "Are you sure?"
    position 0
    answer_type 0
  end
end
