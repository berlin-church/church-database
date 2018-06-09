# frozen_string_literal: true
Rails.application.routes.draw do
  resources :members

  get 'events/index'
  get 'events',               to: "events#index"
  get 'events/:id',           to: "events#show"
  get 'events/:id/register',  to: "events#register"
  post 'events/:id/register', to: "events#create_member"

  get "api/questionnaires",                                   to: "api/questionnaires#index"
  get "api/questionnaires/:id",                               to: "api/questionnaires#show"
  get "api/questionnaires/:id/question-groups",               to: "api/questionnaires#question_groups"
  get "api/questionnaires/:id/relationships/question-groups", to: "api/questionnaires#question_groups"

  get "api/question-groups",                                   to: "api/question_groups#index"
  get "api/question-groups/:id",                               to: "api/question_groups#show"
  get "api/question-groups/:id/questions",                     to: "api/question_groups#questions"
  get "api/question-groups/:id/relationships/questions",       to: "api/question_groups#questions"

  get "api/events",                                            to: "api/events#index"
  get "api/events/:id",                                        to: "api/events#show"
  get "api/events/:id/instances",                              to: "api/events#event_instances"
  get "api/events/:id/relationships/instances",                to: "api/events#event_instances"

  get "api/option-answers/",                                    to: "api/option_answers#index"
  get "api/option-answers/:id",                                 to: "api/option_answers#show"

  get "api/question-options/",                                  to: "api/question_options#index"
  get "api/question-options/:id",                               to: "api/question_options#show"
  get "api/question-options/:id/question",                      to: "api/question_options#question"
  get "api/question-options/:id/relationships/question",        to: "api/question_options#question"

  get "api/questions/",                                         to: "api/questions#index"
  get "api/questions/:id",                                      to: "api/questions#show"
  get "api/questions/:id/question-options",                     to: "api/questions#question_options"
  get "api/questions/:id/relationships/question-options",       to: "api/questions#question_options"

  get "api/option_answer/",                                     to: "api/option_answers#index"
  get "api/option_answer/:id",                                  to: "api/option_answers#show"
  get "api/option_answer/:id/question-option",                  to: "api/option_answers#question_option"

  devise_for :members
  use_doorkeeper
  # devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'admin/members#index'
end
