class OptionAnswer < ApplicationRecord
  belongs_to :question_option
  belongs_to :attendee
end
