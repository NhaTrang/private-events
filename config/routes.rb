Rails.application.routes.draw do
  resources :users, only: [:create,:new]

  get 'users' => 'users#index'
  get 'users/:id' => 'users#show', as: :user_info

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', via: :delete

  get 'events' => 'events#index'
  get 'events/new' => 'events#new'
  post 'events' => 'events#create'
  get 'events/:id' => 'events#show', as: :event_info
  patch 'events/:id' => 'events#attend', as: :attend

  root 'static_pages#index'
end
