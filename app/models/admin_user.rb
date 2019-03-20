# frozen_string_literal: true

# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default("guest"), not null
#  first_name             :string
#  last_name              :string
#

class AdminUser < ApplicationRecord
  role_based_authorizable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable # and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable,
         :trackable, :validatable
         # :lockable, :timeoutable

  has_many :members, foreign_key: :created_by
  belongs_to :member, optional: true

  def name
    "#{first_name} #{last_name}"
  end
end
