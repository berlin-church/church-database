# == Schema Information
#
# Table name: questionnaires
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Questionnaire < ApplicationRecord
  has_many :event_instances
  has_many :question_groups
end
