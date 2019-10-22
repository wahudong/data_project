# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'electoral_wards/index'
  # get 'electoral_wards/show'
  # get 'neighbourhoods/index'
  # get 'neighbourhoods/show'
  # get 'service_requests/index'
  # get 'service_requests/show'
  # get 'aboutme/index'

  resources :service_requests, only: %i[index show]
  resources :aboutme, only: :index
  resources :neighbourhoods, only: %i[index show]
  resources :electoral_wards, only: %i[index show]
  root to: 'service_requests#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
