# frozen_string_literal: true
ActiveAdmin.register Member do
  permit_params :first_name,
                :last_name,
                :gender,
                :birthday,
                :phone1,
                :phone2,
                :email,
                :password,
                :password_confirmation,
                address_attributes: [:id, :street, :street_number, :zip_code, :city, :country, _destroy: true]

  index do
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone1
    column :gender
    column :updated_at
  end

  form title: 'Creating / Updating' do |f|
    inputs 'Details' do
      input :first_name
      input :last_name
      input :gender, collection: %w(Male Female)
      input :email
      input :password
      input :password_confirmation
      input :birthday, start_year: Date.today.year - 90, end_year: Date.today.year
      input :phone1
      input :phone2
      inputs do
        has_many :address do |a|
          a.input :street
          a.input :street_number
          a.input :zip_code
          a.input :city
          a.input :country, priority_countries: ['DE']
        end
      end
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    para 'Press cancel to return to the list without saving.'
    actions
  end

  collection_action :email_csv, method: :get do
    klass = params[:resource_class].singularize.capitalize.constantize
    @q = klass.ransack(params[:q])
    @result = @q.result(distinct: true).select(:email).map(&:email)

    send_data @result.to_a.to_s.delete('[').delete(']').delete('"')
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :gender
      row :email
      row :birthday
      row :phone1
      row :phone2
    end

    panel :addresses do
      table_for member.address do
        column :id do |address|
          link_to address.id, admin_address_path(address) if address
        end
        column :street
        column :street_number
        column :city
        column :area_code
        column :country
      end
    end
    active_admin_comments
  end
end
