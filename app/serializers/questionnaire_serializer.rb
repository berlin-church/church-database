class QuestionnaireSerializer
  include JSONAPI::Serializer
  
  attributes :id, :name, :position
  has_many :question_groups
end
