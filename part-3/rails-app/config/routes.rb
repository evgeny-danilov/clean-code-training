# frozen_string_literal: true

Rails.application.routes.draw do
  resources :invitations, only: %i[new create]
  resources :reports, only: %i[show]

  namespace :admin do
    resources :reports, only: %i[show]
  end
end
