class MembersController < ApplicationController
  def index
  end

  def create
    return render_event_not_found unless @event_instance = EventInstance.find_by(id: params[:event_instance_id])

    load_or_create_member
    join_event
    answer_questions
    notify_event_leader

    if @member.save
      render_member_created
    else
      render_member_errors
    end
  end

  private

  def notify_event_leader
    
  end

  def answer_questions
    questions_params&.each do |question, answer|
      @member.answer_question(question, answer)
    end
  end

  def render_member_errors
    flash.now[:error] = @member.errors.full_messages.flatten.join(", ")
    render 'events/register'
  end

  def render_member_created
    flash[:notice] = I18n.t 'members.successfully_registred'
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
    return if @member.attendees.where(event_instance_id: @event_instance.id).any?

    @member.attendees << Attendee.new(member_id: @member.id, event_instance_id: @event_instance.id)
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :phone1)
  end

  def questions_params
    params["questions"]
  end
end
