class QuestionOptionSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :position
  has_one :question
end
