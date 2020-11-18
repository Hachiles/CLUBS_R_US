Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard' => 'users#show', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clubs do
    resources :bookings, only: [ :index, :new, :create ]
  end
  resources :bookings, only: [ :update ]
end
