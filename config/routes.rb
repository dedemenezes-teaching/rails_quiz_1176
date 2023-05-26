Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/search", to: "songs#search"
  get "/songs/named/:name", to: "songs#search"

  resources :songs do
    resources :reviews, only: [:new, :create]
  end
  # get '/songs', to: 'songs#index'
  # get '/songs/:id', to: 'songs#show'
  # get '/songs/new', to: 'songs#new' # ONLY EXISTS TO DISPLAY THE FORM
  # post '/songs', to: 'songs#create'
  # get '/songs/:id/edit', to: 'songs#edit' # ONLY EXISTS TO DISPLAY THE FORM
  # patch '/songs/:id', to: 'songs#update'
  # delete '/songs/:id', to: 'songs#destroy'

end
