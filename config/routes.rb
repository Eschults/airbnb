Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :flats, only: [:index, :new, :create, :show, :edit, :update] do
    resources :bookings, only: [:new, :create, :edit, :update, :show]
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]

  root to: "pages#home"
  get '/about', to: "pages#about"
end
