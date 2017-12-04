ActiveAdmin.register QuestionGroup do
  menu parent: "Questionnaires"

  permit_params :questionaire_id, :title, :subtitle, :postion
end
