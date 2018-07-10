# frozen_string_literal: true
class Attendee < ApplicationRecord
  belongs_to :member
  belongs_to :event_instance
  has_many :question_answers, dependent: :destroy
  has_many :option_answers, dependent: :destroy

  def answer_question(question_id, answer)
    question = Question.find_by(id: question_id.to_i)
    if question.answer_type == "open"
      question_answers << QuestionAnswer.new(question: question, attendee: self, answer: answer)
    else
      option_answers << OptionAnswer.new(question_option_id: answer)
    end
  end
end
