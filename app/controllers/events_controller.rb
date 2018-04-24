class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def register
    @member = Member.new
    @id = params[:id]
    @event = Event.find_by id: @id
  end
end
