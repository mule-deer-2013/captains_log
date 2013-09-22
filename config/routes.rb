CaptainsLog::Application.routes.draw do

  root to: "questions#index"

  resources :users, only: [:new, :create, :show]
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

  resources :questions, only: [:new, :show, :create]

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
