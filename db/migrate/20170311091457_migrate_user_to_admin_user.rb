class MigrateUserToAdminUser < ActiveRecord::Migration[5.0]
  def change
    User.find_each do |user|
      admin_user = AdminUser.new
      next unless AdminUser.where(email: user.email).first.nil?
      admin_user.email = user.email
      admin_user.encrypted_password = user.encrypted_password
      admin_user.reset_password_token = user.reset_password_token
      admin_user.reset_password_sent_at = user.reset_password_sent_at
      admin_user.remember_created_at = user.remember_created_at
      admin_user.sign_in_count = user.sign_in_count
      admin_user.current_sign_in_at = user.current_sign_in_at
      admin_user.last_sign_in_at = user.last_sign_in_at
      admin_user.current_sign_in_ip = user.current_sign_in_ip
      admin_user.last_sign_in_ip = user.last_sign_in_ip
      admin_user.created_at = user.created_at
      admin_user.updated_at = user.updated_at
      admin_user.save!(validate: false)
    end
  end
end
