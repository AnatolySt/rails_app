Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  resources :tickets
  resource :search, only: [:new, :show, :edit] do
    post :new
  end

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
    resources :routes
    resources :users
    resources :carriages
    resources :tickets
  end

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
