# frozen_string_literal: true
ActiveAdmin.register Event do
  menu parent: 'Events'

  permit_params :name, :description, :image_url, :is_visible
end
