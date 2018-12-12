# == Schema Information
#
# Table name: question_options
#
#  id          :integer          not null, primary key
#  question_id :integer
#  title       :string
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionOption < ApplicationRecord
  belongs_to :question
  has_many :option_answers
end
