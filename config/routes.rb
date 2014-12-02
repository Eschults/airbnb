Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :flats, only: [:new, :create, :show, :edit, :update] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]

  resources :bookings, only: [:show] do
    member do
      post :answer
    end
  end

  root to: "flats#index"
end
