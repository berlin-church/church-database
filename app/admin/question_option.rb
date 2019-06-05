ActiveAdmin.register QuestionOption do
  menu parent: "Questionnaires"

  form do |f| 
    inputs '' do
      input :question, :collection => Question.order(:title)
      input :title
      input :position
    end
    actions
  end

  permit_params :title, :position, :question_id

end
