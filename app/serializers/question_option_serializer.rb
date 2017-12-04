class QuestionOptionSerializer < ActiveModel::Serializer
  attributes :id, :title, :position
  has_one :question
end
