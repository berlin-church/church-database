ActiveAdmin.register Questionnaire do
  menu parent: "Questionnaires"

  permit_params :name, :event_instance_id
end
