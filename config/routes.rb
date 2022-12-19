Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "articles#index"

  resources :users

  resources :articles do

    resources :comments do
      resources :poly_likes
    end

    resources :poly_likes

  end

end
