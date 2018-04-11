class QuestionGroupSerializer
  include JSONApi::Serializer

  attributes :id, :title, :position
  has_many :questions
end
