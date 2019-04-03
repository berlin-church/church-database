# frozen_string_literal: true
ActiveAdmin.register Address do
  permit_params :street, :street_number, :city, :zip_code, :country

  controller do
    def scoped_collection
      if current_admin_user.admin?
        Address.all
      else
        Address.where(member_id: current_admin_user&.member&.id)
      end
    end
  end

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
end
