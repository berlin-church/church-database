# frozen_string_literal: true
ActiveAdmin.register Event do
  permit_params :name, :description
end
