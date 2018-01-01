class QuestionGroupSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :position
  has_many :questions
end
