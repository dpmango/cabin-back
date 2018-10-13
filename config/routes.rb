Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :signup_leads, only: [:create, :update]
  get '/calendar', to: 'calendar#index'
  get '/calendar/:date', to: 'calendar#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/oauth2callback', to: 'google#callback'
  resources :onboardings, only: [:index, :show, :create, :update]
  #tokens for cabin-admin
  post 'user/token' => 'user_token#create'
  get 'users/current' => 'users#current'
end
