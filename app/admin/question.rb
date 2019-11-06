ActiveAdmin.register Question do
  menu parent: "Questionnaires"

  permit_params :questionaire_id, :question_group_id, :position, :title, :sub_title, :answer_type
end
