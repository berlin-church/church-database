# frozen_string_literal: true

# == Schema Information
#
# Table name: question_groups
#
#  id               :integer          not null, primary key
#  questionnaire_id :integer
#  title            :string
#  subtitle         :text
#  position         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :question_group do
    questionnaire
  end
end
