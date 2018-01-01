ActiveAdmin.register OptionAnswer do
  menu parent: "Questionnaires"

  permit_params :question_option_id, :member_id
end
