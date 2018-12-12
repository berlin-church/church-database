# == Schema Information
#
# Table name: question_answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  answer      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attendee_id :integer
#

class QuestionAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :attendee
end
