Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :characters, only: :index
      get '/regions/:house', to: 'characters#houses'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :users
      resources :likes
    end
  end
end
