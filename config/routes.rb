Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, controllers: { sessions: "users/sessions" }

  resources :flats, only: [:new, :create, :show, :edit, :update] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show]

  resources :bookings, only: [:show] do
    member do
      post :answer
    end
  end

  root to: "flats#index"
end
