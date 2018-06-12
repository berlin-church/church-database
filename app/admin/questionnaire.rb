ActiveAdmin.register Questionnaire do
  menu parent: "Questionnaires"

  permit_params :name, :position
end
