Rails.application.routes.draw do
  # landing and users resources
  root 'users#new'
  resources :users

  # handle connections and connections list for admin
  get '/connections' => 'connections#connections'
  get '/connections/list' => 'connections#list'

  # handles omniauth
  get '/auth/:provider' => 'connections#omniauth', as: 'auth_login'
  match '/auth/:provider/callback' => 'connections#omniauth', via: [:get, :post]

  # handles login view and auth
  get '/login' => 'sessions#login_user'
  post '/login' => 'sessions#auth_user'

  # handles admin login
  get '/login/admin' => 'sessions#login_admin'
  post '/login/admin' => 'sessions#auth_admin'

  # destroy sessions
  get '/logout' => 'sessions#destroy'
end
