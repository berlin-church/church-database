class QuestionSerializer
  include JSONAPI::Serializer
  
  attributes :id, :title, :position
  has_many :question_options
end
