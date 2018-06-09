class EventsController < ApplicationController
  def index
    @events = Event.where(is_visible: true)
  end

  def show
    @event = Event.find_by id: params[:id]
  end

  def register
    @member = Member.new
    @event_instance = EventInstance.find_by id: params[:id]
  end
end
