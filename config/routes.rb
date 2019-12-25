Rails.application.routes.draw do
  get 'messages/create'
  get 'comments/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ####devise###
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }

  ###enduser###
  #homes controller
  root to: 'home#top'
  get '/about', to: 'home#about', as: 'about'
  #users controller
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id', to: 'users#retire', as: 'retire'
  get '/users/retire/complete', to: 'users#complete', as: 'retire_complete'
  #rooms controller
  get '/users/:id/rooms', to: 'rooms#index', as:'myrooms'
  resources :rooms, only: [:create,:show]
  resources :users do
    post '/rooms' => 'rooms#create'
  end

  mount ActionCable.server => '/cable'
  #messages controller
  resources :messages, only: [:create]
  #rounds controller
  get '/myrounds', to: 'rounds#myrounds'
  get '/history', to: 'rounds#history'
  get '/search/rounds', to: 'rounds#search'
  get '/sort/rounds', to: 'rounds#sort'
  post '/rounds/:id', to: 'rounds#apply', as: 'apply_round'
  patch '/rounds/:id', to: 'rounds#approval', as: 'approval_round'
  delete '/rounds/:id', to: 'rounds#refuse', as: 'refuse_round'
  resources :rounds
  get '/maprequest', to: 'rounds#map', as: 'map_request'
  #comments controller
  post '/rounds/:id/comments', to: 'comments#create', as: 'comments'
  get '/rounds/:id/comments/new', to: 'comments#new', as: 'new_comment'
  delete '/comments/:id', to: 'comments#destroy', as: 'comment'

  ###admin###
  namespace :admins do
  	#admins/clients controller
  	resources :clients,  only: [:index]
  	#admins/rounds controller
  	resources :rounds,  only: [:index]
  end

end
