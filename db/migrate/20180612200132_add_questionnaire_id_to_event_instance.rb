class AddQuestionnaireIdToEventInstance < ActiveRecord::Migration[5.1]
  def change
    add_reference :event_instances, :questionnaire, foreign_key: true
  end
end
