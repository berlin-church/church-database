class QuestionOption < ApplicationRecord
  belongs_to :question
  has_many :option_answers
end
