class QuestionOptionSerializer
  include JSONApi::Serializer

  attributes :id, :title, :position
  has_one :question
end
