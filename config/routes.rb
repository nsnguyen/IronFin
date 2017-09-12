Rails.application.routes.draw do
  root 'welcome#index'

  scope module: :v1 do
    scope 'v1' do
      get 'actors' => 'actors#index'


    end
  end

end
