Rails.application.routes.draw do
  get '/' => 'entries#index'

  get '/entries' => 'entries#index'
  get '/entries/new' => 'entries#new'
  get '/entries/:id' => 'entries#show'
  get '/entries/:id/edit' => 'entries#edit'
  post '/entries' => 'entries#create'
  put '/entries/:id' => 'entries#update'
  delete '/entries/:id' => 'entries#destroy'

  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#delete'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
end
