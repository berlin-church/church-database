# frozen_string_literal: true
ActiveAdmin.register EventInstance do
  menu parent: 'Events'

  show do
    attributes_table do
      row :address
      row :event
      row :start_time
      row :end_time
      row :details
      row :cost
      row :description
      row :image_url do |instance|
        image_tag instance.image_url
      end
    end
    panel :attendees do
      table_for event_instance.attendees do
        column :first_name do |attendee|
          attendee.member.first_name
        end
        column :last_name do |attendee|
          attendee.member.last_name
        end
        column :email do |attendee|
          attendee.member.email
        end
        column :phone do |attendee|
          attendee.member.phone1
        end
        column :created_at
      end
    end
  end

  permit_params :address_id, :event_id, :start_time, :end_time, :details,
                :cost, :image_url, :description
end
