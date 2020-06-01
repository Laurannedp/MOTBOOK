Rails.application.routes.draw do
  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  root to: 'mots#index'
  devise_for :users
  resources :mots do
    resources :tasks, only: [:new, :create, :edit, :update] do
      get "check", to: "tasks#check"
      resources :triggers, only: [:new, :create, :edit, :update]
    end
  end
  resources :tasks, only: [:index, :destroy]
  resources :triggers, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
