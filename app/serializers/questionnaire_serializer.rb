class QuestionnaireSerializer
  include JSONApi::Serializer
  
  attributes :id, :name, :position
  has_many :question_groups
end
