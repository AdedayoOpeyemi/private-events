Rails.application.routes.draw do
  root "users#profile"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/events/all', to: 'events#all'

  resources :users, except: [:index, :new]
  resources :events, except: [:destroy, :edit, :update]
end
