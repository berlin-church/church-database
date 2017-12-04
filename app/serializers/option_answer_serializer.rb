class OptionAnswerSerializer < ActiveModel::Serializer
  attributes :id
  has_one :question_option
  has_one :member
end
