# frozen_string_literal: true
class AdminUser < ApplicationRecord
  role_based_authorizable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable # and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable,
         :trackable, :validatable
         # :lockable, :timeoutable

  has_many :members, foreign_key: :created_by

  def name
    "#{first_name} #{last_name}"
  end
end
