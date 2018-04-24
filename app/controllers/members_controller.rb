class MembersController < ApplicationController
  def index
  end

  def create
    @member = Member.new member_params
    @comment = params[:comment]
    @id = params[:id]

    if event = Event.find_by(id: @id)
      comment = params[:comment]
      if @member.save
        flash.now[:notice] = I18n.t 'members.created'
        render 'events/index'
      else
        flash.now[:error] = @member.errors.full_messages.join(", ")
        render 'events/register'
      end
    else
      flash.now[:error] = I18n.t 'events.not_found'
      render 'events/register'
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :phone1)
  end
end
