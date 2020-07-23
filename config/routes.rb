Rails.application.routes.draw do
  root "users#profile"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/events/all', to: 'events#all'
  post '/events/:id/attend', to: 'events#attend', as: 'attend'
  post '/events/:id/unattend', to: 'events#unattend', as: 'unattend'

  resources :users, except: [:index, :new]
  resources :events, except: [:destroy, :edit, :update]
end
