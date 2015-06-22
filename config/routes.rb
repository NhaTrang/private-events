Rails.application.routes.draw do
  resources :user, only: [:create,:show,:new]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
