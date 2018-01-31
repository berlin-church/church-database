class EventSerializer
  include JSONAPI::Serializer

  attributes :id, :description
  has_many :event_instances
end
