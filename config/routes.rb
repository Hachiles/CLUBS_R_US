Rails.application.routes.draw do
  get 'clubs/index'
  get 'clubs/show'
  get 'clubs/new'
  get 'clubs/create'
  get 'clubs/update'
  get 'clubs/edit'
  get 'clubs/destroy'
  devise_for :users
  root to: 'pages#home'
  get '/dashboard' => 'users#show', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clubs do
    resources :bookings 
  end
end
