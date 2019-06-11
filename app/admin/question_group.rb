ActiveAdmin.register QuestionGroup do
  menu parent: "Questionnaires"

  form do |f| 
    inputs '' do
      input :questionnaire, :collection => Questionnaire.order(:name)
      input :title
      input :subtitle
      input :position
    end
    actions
  end

  permit_params :questionnaire_id, :title, :subtitle, :position
end
