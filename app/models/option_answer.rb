# == Schema Information
#
# Table name: option_answers
#
#  id                 :integer          not null, primary key
#  question_option_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  attendee_id        :integer
#

class OptionAnswer < ApplicationRecord
  belongs_to :question_option
  belongs_to :attendee
end
