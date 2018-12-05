# frozen_string_literal: true

# == Schema Information
#
# Table name: event_instances
#
#  id               :integer          not null, primary key
#  start_time       :datetime
#  end_time         :datetime
#  address_id       :integer
#  details          :text
#  cost             :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  event_id         :integer
#  image_url        :string
#  description      :text
#  name             :string
#  questionnaire_id :integer
#

FactoryBot.define do
  factory :event_instance do
    address
    event
    name "Meu Evento (..)"
  end
end
