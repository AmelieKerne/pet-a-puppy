Rails.application.routes.draw do
  devise_for :users
  root to: 'puppies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :puppies, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create]

  end
  resources :bookings, only: [:index, :show, :edit, :update] do
  end

end
