class MemberMailer < ApplicationMailer

  def new_member(member, event_instance, attendee, comment)
    @comment = comment
    @member = member
    @event_instance = event_instance
    @attendee = attendee
    leaders_email = if event_instance.leaders.any?
                      event_instance.leaders.map{|l| l.member.email }
                    else
                      []
                    end
    mail to: leaders_email.append('groups@berlin.church').join(", "), subject: "#{event_instance.name} - A new member has just signed up"
  end
end
