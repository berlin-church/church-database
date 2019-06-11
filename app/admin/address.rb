# frozen_string_literal: true
ActiveAdmin.register Address do
  permit_params :street, :street_number, :city, :zip_code, :country

  show do
    attributes_table do
      row :id
      row :street
      row :street_number
      row :zip_code
      row :city
      row :country
      row :member
    end
  end

  form do |f| 
    inputs '' do
      input :member, :collection => Member.order(:first_name)
      input :street
      input :street_number
      input :zip_code
      input :city
      input :country
      input :district
    end
    actions
  end

end
