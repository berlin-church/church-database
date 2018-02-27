# frozen_string_literal: true
ActiveAdmin.register AdminUser do
  role_changeable
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :role

  controller do
    def scoped_collection
      #byebug
      if current_admin_user.volunteer? || current_admin_user.guest?
        AdminUser.where(id: current_admin_user.id)
      else
        AdminUser.all
      end
    end
  end

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
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role if current_admin_user.admin?
    end
    f.actions
  end

  # Admin User View

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :role
    end
  end

  controller do
    def update
      #byebug
      resource.first_name = params[:admin_user][:first_name] unless params[:admin_user][:first_name].blank?
      resource.last_name = params[:admin_user][:last_name] unless params[:admin_user][:last_name].blank?
      resource.email = params[:admin_user][:email] unless params[:admin_user][:email].blank?
      resource.password = params[:admin_user][:password] unless params[:admin_user][:password].blank?
      resource.password_confirmation = params[:admin_user][:password_confirmation] unless params[:admin_user][:password_confirmation].blank?
      resource.role = params[:admin_user][:role] unless params[:admin_user][:role].blank? || !current_admin_user.admin?
      resource.save!
      redirect_to "/admin/admin_users"
    end
  end
end
