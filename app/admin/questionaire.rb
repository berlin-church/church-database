ActiveAdmin.register Questionaire do
  menu parent: "Questionnaires"

  permit_params :name, :event_instance_id
end
