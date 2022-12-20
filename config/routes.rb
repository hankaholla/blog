Rails.application.routes.draw do
    
  root "articles#index"

  resources :users

  resources :articles do

    resources :comments do
      resources :poly_likes
    end

    resources :poly_likes

  end

end
