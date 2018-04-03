class EventsController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    events = Event.all
    render json: JSONAPI::Serializer.serialize(events, is_collection: true)
  end

  def show
    event = EventInstance.find_by id: params[:id]
    render json: JSONAPI::Serializer.serialize(event)
  end

  def event_instances
    event = Event.find_by id: params[:id]
    render json: JSONAPI::Serializer.serialize(event.event_instances, is_collection: true)
  end
end
