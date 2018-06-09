class EventSerializer
  include JSONApi::Serializer

  attributes :id, :name, :description, :image_url
  has_many :event_instances
end
