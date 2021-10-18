# frozen_string_literal: true

Rails.application.routes.draw do
  resources :invitations, only: %i[new create]
end
