class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :position
  has_one :question_group
end
