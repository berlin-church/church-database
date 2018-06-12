class Questionnaire < ApplicationRecord
  has_many :event_instances
  has_many :question_groups
end
