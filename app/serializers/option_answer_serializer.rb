class OptionAnswerSerializer
  include JSONAPI::Serializer

  attributes :id
  has_one :question_option
  has_one :member
end
