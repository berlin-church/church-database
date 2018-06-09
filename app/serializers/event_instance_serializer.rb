class EventInstanceSerializer
  include JSONApi::Serializer

  attributes :id, :cost, :details, :start_time, :end_time
end
