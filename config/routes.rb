Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
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
  #home controller
  root to: 'home#top'
  get '/about', to: 'home#about'
  #users controller
  get '/user/:id', to: 'users#show', as: 'user'
  get '/user/unsubscribe', to: 'users#unsubscribe'
  patch '/user/:id', to: 'users#retire', as: 'retire'
  get '/user/complete', to: 'users#complete'
  #message controller
  get '/user/messages', to: 'messages#index'
  get '/messages/:id', to: 'messages#show'
  post '/messages/:id', to: 'messages#create'
  #rounds controller, comments controller
  get '/myrounds', to: 'rounds#myrounds'
  get '/search/rounds', to: 'rounds#search'
  get '/sort/rounds', to: 'rounds#sort'
  post '/round/:id', to: 'rounds#apply', as: 'apply_round'
  patch '/round/:id', to: 'rounds#approval', as: 'approval_round'
  delete '/round/:id', to: 'rounds#refuse', as: 'refuse_round'
  resources :rounds
  post '/rounds/:id/comment', to: 'comments#create', as: 'comments'
  get '/rounds/:id/comment/new', to: 'comments#new', as: 'new_comment'
  delete '/comment/:id', to: 'comments#destroy', as: 'comment'

  ###admin###
  namespace :admins do
  	#admins/clients controller
  	resources :clients,  only: [:index]
  	#admins/rounds controller
  	resources :rounds,  only: [:index]
  end

end
