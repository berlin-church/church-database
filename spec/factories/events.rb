# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_url   :string
#  is_visible  :boolean
#

FactoryBot.define do
  factory :event do
    name 'Meu Evento'
    description 'Nada'
  end
end
