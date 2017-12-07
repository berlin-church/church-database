class Questionnaire < ApplicationRecord
  belongs_to :event_instance
  has_many :question_groups
end
