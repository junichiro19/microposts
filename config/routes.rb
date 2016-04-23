Rails.application.routes.draw do
  root to:  'static_pages#home'
  get    'signup' , to: 'users#new'
  get    'edit'   , to: 'users#edit'
  get    'login'  , to: 'sessions#new'
  post   'login'  , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, onlu: [:create, :destroy]
end
