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
      argument :id,         ID,      required: false
      argument :name,       String,  required: false
      argument :image_url,  String,  required: false
      argument :is_visible, Boolean, required: false
    end

    def event(id:)
      Event.find(id)
    end
  end
end
