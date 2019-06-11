ActiveAdmin.register QuestionAnswer do
  menu parent: "Questionnaires"

  form do |f| 
    inputs '' do
      input :question, :collection => Question.order(:title)
      input :attendee, :collection => Attendee.joins(:member).order('members.first_name')
      input :answer
    end
    actions
  end
end
