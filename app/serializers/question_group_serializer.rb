class QuestionGroupSerializer < ActiveModel::Serializer
  attributes :id, :title, :position
  has_many :questions
end
