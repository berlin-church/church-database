# frozen_string_literal: true
ActiveAdmin.register EventInstance do
  menu parent: 'Events'

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
        p instance.leaders&.map{|leader| "#{leader.member&.first_name} #{leader.member&.last_name}"}.join(", ")
      end
    end
    panel :attendees do
      table_for event_instance.attendees do
        column :first_name do |attendee|
          attendee.member&.first_name
        end
        column :last_name do |attendee|
          attendee.member&.last_name
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
