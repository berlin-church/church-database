class MembersController < ApplicationController
  def index
  end

  def create
    return render_event_not_found unless @event = Event.find_by(id: params[:id])

    load_or_create_member
    join_event

    if @member.save
      render_member_created
    else
      render_member_errors
    end
  end

  private

  def render_member_errors
    flash.now[:error] = @member.errors.full_messages.flatten.join(", ")
    render 'events/register'
  end

  def render_member_created
    flash[:notice] = I18n.t 'members.created'
    redirect_to '/events'
  end

  def render_event_not_found
    flash.now[:error] = I18n.t 'events.not_found'
    render 'events/register'
  end

  def load_or_create_member
    @member   = Member.find_by email: member_params[:email]
    @member ||= Member.new member_params
  end

  def join_event
    instance = @event.current_event_instance
    return if @member.attendees.where(event_instance_id: instance.id).any?

    @member.attendees << Attendee.new(member_id: @member.id, event_instance_id: instance.id)
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :phone1)
  end
end
