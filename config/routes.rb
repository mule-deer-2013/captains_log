CaptainsLog::Application.routes.draw do

  root to: "users#new"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :answers, only: [] do
    resources :votes, only: [:create]
  end

  resources :questions, only: [] do
    resources :votes, only: [:create]
  end

  resources :questions, only: [] do
    resources :answers, only: [:create]
  end

  # "/questions/2/answers"

  resources :questions, only: [:new, :show, :create]

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  # get '/sessions/new', to: 'sessions#new', as: "new_session"
  # post '/sessions', to: 'session#create', as: "sessions"
  # delete '/sessions/:id', to: 'sessions#destroy', as: "sessions"

  # get '/questions/new', to: 'questions#new'
  # get '/questions/:id', to: 'questions#show'
  # post '/questions', to: 'questions#create'

  #resources :users

end
