CaptainsLog::Application.routes.draw do

  root to: "home#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  # get '/sessions/new', to: 'sessions#new', as: "new_session"
  # post '/sessions', to: 'session#create', as: "sessions"
  # delete '/sessions/:id', to: 'sessions#destroy', as: "sessions"

  get '/questions/new', to: 'questions#new'
  get '/questions/:id', to: 'questions#show'

  post '/questions', to: 'questions#create'

  #resources :users

end
