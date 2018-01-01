# frozen_string_literal: true
ActiveAdmin.register EventInstance do
  menu parent: 'Events'

  permit_params :address_id, :event_id, :start_time, :end_time, :details, :cost
end
