class Question < ApplicationRecord
  belongs_to :question_group
  has_many :question_options
end
