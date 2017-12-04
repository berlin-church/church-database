ActiveAdmin.register Question do
  menu parent: "Questionnaires"

  permit_params :questionaire_id, :title, :subtitle
end
