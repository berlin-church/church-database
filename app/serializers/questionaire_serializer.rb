class QuestionaireSerializer < ActiveModel::Serializer
  attributes :id, :title, :position
  has_many :question_groups
end
