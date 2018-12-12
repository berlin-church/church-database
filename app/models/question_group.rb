# == Schema Information
#
# Table name: question_groups
#
#  id               :integer          not null, primary key
#  questionnaire_id :integer
#  title            :string
#  subtitle         :text
#  position         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class QuestionGroup < ApplicationRecord
  belongs_to :questionnaire
  has_many :questions
end
