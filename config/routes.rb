Rails.application.routes.draw do
  get 'dashboard/index'

  get 'dashboard/show'

  get 'dashboard/setting'
  
  get 'visitors/access'

  devise_for :admins
  resources :users
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
