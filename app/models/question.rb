# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  question_group_id :integer
#  title             :string
#  position          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  answer_type       :integer
#

class Question < ApplicationRecord
  belongs_to :question_group
  has_many :question_options
  has_many :question_answers

  enum answer_type: [:open, :single, :multiple]

  def open?
  	answer_type == :open.to_s
  end

  def single?
  	answer_type == :single.to_s
  end

  def multiple?
  	answer_type == :multiple.to_s
  end
end
