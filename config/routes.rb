Rails.application.routes.draw do
  root 'welcome#index'

  scope module: :v1 do
    scope 'v1' do
      get 'actors' => 'actors#index'
      get 'directors' => 'directors#index'
      get 'movies' => 'movies#index'
      # get 'movieActors' => 'movieActors#index'
      # get 'movieDirectors' => 'movieDirectors#index'
      # get 'movieGenres' => 'movieGenres#index'
      # get 'reviews' => 'reviews#index'
    end
  end

end
