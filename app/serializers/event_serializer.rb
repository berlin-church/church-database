class EventSerializer
  include JSONAPI::Serializer

  attributes :id, :description
end
