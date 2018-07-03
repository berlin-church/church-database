# frozen_string_literal: true
ActiveAdmin.register Member do

  scope :with_discarded

  member_action :archive, method: :get do
    resource.discard
    redirect_to admin_members_path, notice: "Member #{resource.id} archived"
  end

  controller do
    def scoped_collection
      if current_admin_user.volunteer? || current_admin_user.guest?
        current_admin_user.members.kept
      else
        Member.kept
      end
    end
  end

  # Registration / Updating

  permit_params :first_name,
                :last_name,
                :gender,
                :birthday,
                :phone1,
                :phone2,
                :email,
                :password,
                :password_confirmation,
                :created_by,
                :status,
                address_attributes: [:id, :street, :street_number, :zip_code, :city, :country, _destroy: true]

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone1
    column :gender
    column :status
    column :updated_at
    column :admin_user
    column :last_comment_created do |member|
      ActiveAdmin::Comment.where(resource_id: member.id, resource_type: "Member").last&.created_at
    end
    column :created_at
    column :archive do |member|
      link_to "archive", archive_admin_member_path(member)
    end
    actions
  end

  form title: 'Creating / Updating' do |f|
    inputs 'Details' do
      input :first_name
      input :last_name
      input :gender, collection: %w(Male Female)
      input :email
      input :birthday, start_year: Date.today.year - 90, end_year: Date.today.year
      input :phone1
      input :phone2
      inputs do
        has_many :address do |a|
          a.input :street, label: 'District or Street Name'
          a.input :street_number
          a.input :zip_code
          a.input :city
          a.input :country, priority_countries: ['DE']
        end
      end
      input :status, as: :radio unless f.object.new_record?
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    para 'Press cancel to return to the list without saving.'
    actions
  end

  # CSV export

  collection_action :email_csv, method: :get do
    klass = params[:resource_class].singularize.capitalize.constantize
    @q = klass.ransack(params[:q])
    @result = @q.result(distinct: true).select(:email).map(&:email)

    send_data @result.to_a.to_s.delete('[').delete(']').delete('"')
  end

  # Sidepanel for events

  sidebar 'Upcoming Events', only: :show do
    ul do
      EventInstance.upcoming.each do |event|
        li event.name_with_date
      end
    end
  end

  # Member View

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :gender
      row :email
      row :birthday
      row :phone1
      row :phone2
      row :created_at
      row 'Follow-Up Status' do
        member.status
      end
      row 'Created By' do
        member.admin_user&.name
      end
    end

    panel :addresses do
      table_for member.address do
        column :id do |address|
          link_to address.id, admin_address_path(address) if address
        end
        column 'District or Street Name' do
          member.address.street if member.address
        end
        column :street_number
        column :city
        column :zip_code
        column :country
      end
    end

    active_admin_comments
    panel 'See the diagram below for instructions on how to follow up' do
      image_tag('follow-up-diagram.png', class: 'follow_up_diagram')
    end
  end

  # Adjust the controller to set the created_by id derived from the logged in admin user

  controller do
    def create
      create!
      resource.created_by = current_admin_user.id
      resource.save
    end
  end
end
