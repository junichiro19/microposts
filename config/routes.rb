Rails.application.routes.draw do
  root to:  'static_pages#home'
  get    'signup' , to: 'users#new'
  get    'edit'   , to: 'users#edit'
  get    'login'  , to: 'sessions#new'
  post   'login'  , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  get    'relationships/:id/show_follower' => 'relationships#show_follower' , as:  'follower'
  get    'relationships/:id/show_followed' => 'relationships#show_followed' , as:  'followed'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:show_followed, :show_follower, :create, :destroy]
end
