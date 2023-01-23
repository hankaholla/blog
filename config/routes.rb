Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }
    
  root "articles#index"

  resources :users

  resources :articles do

    member do
      get "print", format: 'pdf'
    end

    resources :comments do
      resources :poly_likes
    end

    resources :poly_likes

  end

end
