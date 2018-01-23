# frozen_string_literal: true
ActiveAdmin.register AdminUser do
  role_changeable
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    # column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
    end
    f.actions
  end

  controller do
    def update
      resource.role = params[:admin_user][:role] unless params[:admin_user][:role].blank?
      resource.password = params[:password] unless params[:password].blank?
      resource.password_confirmation = params[:password_confirmation] unless params[:password_confirmation].blank?
      resource.save!
    end
  end
end
