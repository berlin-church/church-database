class OptionAnswerSerializer
  include JSONApi::Serializer

  attributes :id
  has_one :question_option
  has_one :member
end
