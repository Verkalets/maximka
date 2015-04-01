Rails.application.routes.draw do
  get 'dashboard/index'

  get 'dashboard/show'

  get 'dashboard/setting'

  get 'dashboard/statistic'

  get 'visitors/access'

  get 'visitors/index'
  devise_for :admins
  resources :users

  root to: 'visitors#index'


  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/vkontakte/callback' => 'sessions#vkontakte'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signin_vk' => 'sessions#new_vk', :as => :signin_vk
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
