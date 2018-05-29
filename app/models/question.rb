class Question < ApplicationRecord
  belongs_to :question_group
  has_many :question_options
  has_many :question_answers

  enum answer_type: [:open, :single, :multiple]
end
