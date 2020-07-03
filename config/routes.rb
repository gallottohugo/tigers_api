Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'


  #namespace :v1 do
    #resources :sessions, only: [:create, :destroy]
    #resources :users, only: [ :create, :destroy ]
  #end 
end
