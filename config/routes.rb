Rails.application.routes.draw do
  root to: 'mots#index'
  resources :mots do
    resources :tasks, only: [:new, :create, :edit, :update] do
      resources :actions, only: [:new, :create, :edit, :update]
  end
  resources :tasks, only: [:index, :destroy]
  resources :action, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
