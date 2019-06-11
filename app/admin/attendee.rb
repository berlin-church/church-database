# frozen_string_literal: true
ActiveAdmin.register Attendee do
  menu parent: 'Events'

  show do
    attributes_table do
      row :member
      row :event_instance
      row :paid
      row :canceled
      row :comment
      row :created_at
      row :updated_at
    end
    panel "Questions" do
      table_for attendee.option_answers do
        column :question do |answer|
          link_to answer.question_option.question.title, admin_question_path(answer.question_option.question)
        end
        column :answer do |answer|
          answer.question_option.title
        end
      end
    end

    panel "Open questions" do
      table_for attendee.question_answers do
        column :question do |answer|
          link_to answer.question.title, admin_question_path(answer.question)
        end
        column :answer do |answer|
          answer.answer
        end
      end
    end
  end

  form do |f| 
    inputs '' do
      input :member, :collection => Member.order(:first_name)
      input :event_instance, :collection => EventInstance.order(:name)
      input :form_reply
      input :comment
      input :paid
      input :canceled
      input :terms_accepted
    end
    actions
  end

  permit_params :member_id,
                :event_instance_id,
                :form_reply,
                :canceled,
                :paid,
                :comment,
                :terms_accepted
end
