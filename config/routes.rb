# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#home'
  resources :feeds do
    resources :items, only: %i[index] do
      put :all_read, on: :collection
    end
    get :list, on: :collection
    put :refresh, on: :collection
    get :icon
  end
  resources :items, only: %i[update index] do
    put :all_read, on: :collection
  end
  resources :folders do
    resources :items, only: %i[index] do
      put :all_read, on: :collection
    end
  end
  resource :settings, only: %i[update]
  namespace :subscriptions do
    post :import
    # get :export
  end
end
