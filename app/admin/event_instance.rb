# frozen_string_literal: true

ActiveAdmin.register EventInstance do
  menu parent: 'Events'

  index do
    selectable_column
    id_column
    column :event
    column :name
    column :start_time
    column :end_time
    actions
  end

  show do
    attributes_table do
      row :name
      row :address
      row :event
      row :start_time
      row :end_time
      row :details
      row :cost
      row :description
      row :image_url do |instance|
        image_tag instance.image_url if instance.image_url
      end
      row :leaders do |instance|
        p instance.leaders&.map { |leader| "#{leader.member&.first_name} #{leader.member&.last_name}" }.join(", ")
      end
    end

    attributes_table title: 'Attendees' do
      event_instance.attendees.each do |attendee|
        row "#{attendee.member&.first_name} #{attendee.member&.last_name}" do
          tabs do
            tab :details do
              table_for [attendee] do
                column :attendee do |attendee|
                  link_to attendee.id, admin_attendee_path(attendee)
                end
                column :member do |attendee|
                  link_to attendee.member_id, admin_member_path(attendee.member)
                end
                column :email do |attendee|
                  attendee.member&.email
                end
                column :phone do |attendee|
                  attendee.member&.phone1
                end
                column :created_at
              end
            end
            tab :answers do
              panel "" do
                answers = attendee.option_answers.map { |answer| [answer.question_option.question.title, answer.question_option.title] }
                attendee.question_answers.each { |answer| answers << [answer.question.title, answer.answer] }

                table_for answers do
                  column :question do |answer|
                    answer[0]
                  end
                  column :answer do |answer|
                    answer[1]
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  form title: 'Creating / Updating' do |f|
    inputs 'Details' do
      input :name
      input :event
      input :address
      input :start_time
      input :end_time
      input :details
      input :cost
      input :image_url
      input :description
      input :questionnaire
      inputs do
        has_many :leaders, allow_destroy: true do |a|
          a.input :member
        end
      end
    end
    actions
  end

  permit_params :name, :questionnaire_id, :address_id, :event_id, :start_time, :end_time, :details,
                :cost, :image_url, :description, leaders_attributes: [:member_id, :_destroy, :id]
end
