Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
    collection do
      get :top
    end
    member do
      get :chef
    end
    resources :reviews, only: [ :new, :create ]
  end
  resources :review, only: [:destroy]
end
