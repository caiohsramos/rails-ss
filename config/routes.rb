# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#home'
  resources :feeds do
    resources :items, only: %i[index]
    get :list, on: :collection
    put :refresh, on: :collection
    get :icon
    get :unread_list, on: :collection
  end
  resources :items, only: %i[update index] do
    put :current_read, on: :collection
  end
  resources :folders do
    resources :items, only: %i[index]
  end
  resource :settings, only: %i[update]
  namespace :subscriptions do
    post :import
    # get :export
  end
  namespace :pages do
    get :hotkeys
  end
  resource :session, only: %i[new create]
  # Render dynamic PWA files from app/views/pwa/*
  get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest
end
