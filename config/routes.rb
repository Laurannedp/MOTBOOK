Rails.application.routes.draw do
  root to: 'mots#index'
  devise_for :users
  resources :mots do
    resources :tasks, only: [:new, :create, :edit, :update] do
      resources :actions, only: [:new, :create, :edit, :update]
    end
  end
  resources :tasks, only: [:index, :destroy]
  resources :actions, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
