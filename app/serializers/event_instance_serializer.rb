class EventInstanceSerializer
  include JSONAPI::Serializer

  attributes :id, :cost, :details, :start_time, :end_time
end
