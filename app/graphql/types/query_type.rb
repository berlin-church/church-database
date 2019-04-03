module Types
  class QueryType < Types::BaseObject
    field :events, [Types::EventType], null: false do
       description "All events"
     end

     def events
       Event.all
     end

    field :event, Types::EventType, null: true do
      description 'A event!'
      argument :name, String, required: false
    end

    def event(id:)
      Event.find(id)
    end
  end
end
