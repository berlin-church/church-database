class EventsController < ApplicationController
  def index
    @resources = Event.all
  end

  def register
    @member = Member.new
  end
end
