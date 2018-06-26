class QuestionAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :attendee
end
