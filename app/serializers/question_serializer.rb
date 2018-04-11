class QuestionSerializer
  include JSONApi::Serializer
  
  attributes :id, :title, :position
  has_many :question_options
end
