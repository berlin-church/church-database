# frozen_string_literal: true
Rails.application.routes.draw do
  resources :option_answers
  resources :question_options
  resources :questions
  devise_for :members
  use_doorkeeper
  # devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
