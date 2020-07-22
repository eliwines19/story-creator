Rails.application.routes.draw do
  root "sessions#home"

  get '/users/projects' => 'users#projects'
  get '/users/most_tasks' => 'projects#most_tasks'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  get '/logout' => 'sessions#destroy'

  #omniauth callback route
  get "/auth/google_oauth2/callback" => 'sessions#google'

  resources :projects do
    resources :tasks
  end

  resources :tasks

  resources :users do
    resources :projects, shallow: true
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
