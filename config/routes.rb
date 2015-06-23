Rails.application.routes.draw do
  resources :users, only: [:create,:new]

  get 'users' => 'users#show'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', via: :delete

  root 'users#show'
end
