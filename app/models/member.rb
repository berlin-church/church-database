# frozen_string_literal: true
class Member < ApplicationRecord
  include Discard::Model
  
  belongs_to :family, optional: true
  belongs_to :admin_user, foreign_key: :created_by
  has_one :address, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :option_answers
  has_many :question_answers
  has_many :leaders

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
