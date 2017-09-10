Rails.application.routes.draw do
  resources :reviews
  resources :movie_actors
  resources :movie_directors
  resources :movie_genres
  resources :directors
  resources :actors
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
