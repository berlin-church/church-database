# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  gender                 :string
#  birthday               :date
#  email                  :string
#  phone1                 :string
#  phone2                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  family_id              :integer
#  address_id             :integer
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  status                 :integer          default("New")
#  created_by             :integer          default(1)
#  discarded_at           :datetime
#  status_changed_at      :datetime
#

class Member < ApplicationRecord
  include Discard::Model

  belongs_to :family, optional: true
  belongs_to :admin_user, foreign_key: :created_by
  has_one :address, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :option_answers, through: :attendees
  has_many :question_answers, through: :attendees
  has_many :leaders
  has_one :access_account,
          class_name: AdminUser.name,
          foreign_key: :member_id,
          dependent: :nullify

  accepts_nested_attributes_for :access_account

  accepts_nested_attributes_for :address
  validates_format_of :first_name, :last_name, with: /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :first_name, :last_name, :gender, presence: true

  validates :email, uniqueness: true, allow_blank: false, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  enum status: [:New, :in_progress, :connected, :resolved]

  before_save :save_status_changed_date

  def name
    "#{first_name} #{last_name}"
  end

  private

  def save_status_changed_date
    self.status_changed_at = DateTime.now if self.status_changed? && self.status == "in_progress"
  end
end
