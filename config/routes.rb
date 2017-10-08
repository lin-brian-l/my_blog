Rails.application.routes.draw do
  resources :users, :sessions # required for route helpers in view files (link_to)

  resources :entries, controller: 'posts'

# routes for application_controller.rb
  get '/' => 'entries#index'
# routes for application_controller.rb

# routes for posts_controller.rb
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  post '/posts' => 'posts#create'
  put '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'
# routes for entries_controller.rb

# routes for sessions_controller.rb
  # named routes (as:) ----------------------------
  # get '/sessions/new' => 'sessions#new' # <-- typical way
  get '/login', to: 'sessions#new', as: 'login' # <-- new way
  # ----------------------------------------------

  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#delete'
# routes for sessions_controller.rb

# routes for users_controller.rb
  # named routes (as:) ---------------------------
  # get '/users/new' => 'users#new' # <-- typical way
  get '/register', to: 'users#new', as: 'register' # <-- new way
  # ----------------------------------------------
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
# routes for users_controller.rb
end
