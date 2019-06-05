ActiveAdmin.register OptionAnswer do
  menu parent: "Questionnaires"

  form do |f| 
    inputs '' do
      input :question_option
      input :attendee, :collection => Attendee.joins(:member).order('members.first_name')
    end
    actions
  end

  permit_params :question_option_id, :member_id
end
