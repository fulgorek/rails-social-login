Rails.application.routes.draw do
  # landing and users resources
  root 'users#new'
  get '/users' => 'users#new', as: 'users'
  post '/users' => 'users#create', as: 'create_users'

  # resources :users

  # handle connections and connections list for admin
  get '/connections' => 'connections#connections'
  get '/connections/list' => 'connections#list'

  # handles omniauth
  get '/auth/:provider' => 'connections#omniauth', as: 'auth_login'
  match '/auth/:provider/callback' => 'connections#omniauth', via: [:get, :post]

  # handles login view and auth
  get '/login' => 'sessions#login_user'
  post '/login' => 'sessions#auth'

  # handles admin login
  get '/login/admin' => 'sessions#login_admin'
  post '/login/admin' => 'sessions#auth'

  # destroy sessions
  get '/logout' => 'sessions#destroy'
end
