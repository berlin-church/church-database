# frozen_string_literal: true

# == Schema Information
#
# Table name: attendees
#
#  id                :integer          not null, primary key
#  form_reply        :text
#  paid              :boolean
#  member_id         :integer
#  event_instance_id :integer
#  canceled          :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  comment           :text
#  terms_accepted    :boolean
#

class Attendee < ApplicationRecord
  belongs_to :member
  belongs_to :event_instance
  has_many :question_answers, dependent: :destroy
  has_many :option_answers, dependent: :destroy

  def name
    "#{member.name} "
  end

  def answer_question(question_id, answer)
    question = Question.find_by(id: question_id.to_i)
    if question.open?
      question_answers << QuestionAnswer.new(question: question, attendee: self, answer: answer)
    elsif question.multiple?
      answer.each do |a|
        option_answers << OptionAnswer.new(question_option_id: a.to_i, attendee: self)
      end
    else
      option_answers << OptionAnswer.new(question_option_id: answer.first, attendee: self)
    end
  end
end
