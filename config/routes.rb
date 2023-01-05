Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  # devise_for :users
    
  root "articles#index"

  resources :users

  resources :articles do

    resources :comments do
      resources :poly_likes
    end

    resources :poly_likes

  end

end
