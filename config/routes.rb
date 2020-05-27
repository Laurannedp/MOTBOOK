Rails.application.routes.draw do

  root to: 'mots#index'
  devise_for :users
  resources :mots

  get 'tasks/create'
  get 'tasks/update'
  devise_for :users
  root to: 'mots#index'
  resources :mots do
    resources :tasks, only: [:new, :create, :edit, :update]
  end
  resources :tasks, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
