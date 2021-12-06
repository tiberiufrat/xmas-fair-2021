require 'sidekiq/web'

Rails.application.routes.draw do
  resources :spiridon_purchases
  resources :products
  match 'user_list/:id' => 'user_lists#destroy', :via => :delete, :as => :admin_destroy_user
  resources :purchases
  resources :stands
  devise_for :users
  resources :user_lists
  post '/change_language',  to: 'user_lists#change_language', as: 'change_user_language'
  post '/change_theme',     to: 'user_lists#change_theme',    as: 'change_user_theme'
  get  '/search',           to: 'home#search',                as: 'search'
  get  '/profile',          to: 'home#profile',               as: 'profile'
  get  '/about',            to: 'home#about',                 as: 'about'
  # get '/user_list', to: 'user_lists#index', as: 'user_lists'
  # get '/new_user', to: 'user_lists#new', as: 'new_user_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  mount Sidekiq::Web => '/sidekiq'
end
