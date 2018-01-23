class EventsController < ApplicationController
  # before_action :doorkeeper_authorize!

  def index
    def index
      events = Event.all
      render json: JSONAPI::Serializer.serialize(events, is_collection: true)
    end

    def show
      event = Event.find_by id: params[:id]
      render json: JSONAPI::Serializer.serialize(event)
    end

    def event_instances
      event = EventInstance.find_by id: params[:id]
      render json: JSONAPI::Serializer.serialize(event.event_instances)
    end
  end
end
