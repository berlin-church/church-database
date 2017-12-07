# frozen_string_literal: true
Rails.application.routes.draw do
  get "/questionnaires",                                   to: "questionnaires#index"
  get "/questionnaires/:id",                               to: "questionnaires#show"
  get "/questionnaires/:id/question-groups",               to: "questionnaires#question_groups"
  get "/questionnaires/:id/relationships/question-groups", to: "questionnaires#question_groups"

  get "/question-groups",                             to: "question_groups#index"
  get "/question-groups/:id",                         to: "question_groups#show"
  get "/question-groups/:id/questions",               to: "question_groups#questions"
  get "/question-groups/:id/relationships/questions", to: "question_groups#questions"

  get "/option-answers/",                to: "option_answers#index"
  get "/option-answers/:id",             to: "option_answers#show"

  get "/question-options/",                            to: "question_options#index"
  get "/question-options/:id",                         to: "question_options#show"
  get "/question-options/:id/question",                to: "question_options#question"
  get "/question-options/:id/relationships/question",  to: "question_options#question"

  get "/questions/",                                   to: "questions#index"
  get "/questions/:id",                                to: "questions#show"
  get "/questions/:id/question-options",               to: "questions#question_options"
  get "/questions/:id/relationships/question-options", to: "questions#question_options"

  devise_for :members
  use_doorkeeper
  # devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
