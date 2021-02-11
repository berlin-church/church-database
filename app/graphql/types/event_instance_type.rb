class Types::EventInstanceType < Types::BaseObject
  field :id, ID, null: false
  field :event, EventType, null: false
end
