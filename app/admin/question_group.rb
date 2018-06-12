ActiveAdmin.register QuestionGroup do
  menu parent: "Questionnaires"

  permit_params :questionnaire_id, :title, :subtitle, :position
end
