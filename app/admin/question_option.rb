ActiveAdmin.register QuestionOption do
  menu parent: "Questionnaires"


permit_params :title, :position, :question_id

end
