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

FactoryBot.define do
  sequence :email do |n|
    "mario#{n}@gemail.com"
  end

  factory :member do
    first_name 'Mario'
    last_name 'Bros'
    gender :male
    email { generate(:email) }
    admin_user
  end
end
