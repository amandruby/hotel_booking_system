Rails.application.routes.draw do
  get 'rooms/search'
  get 'rooms/do_search'
  resources :reservations

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :show]
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"


  root to: "reservations#index"
end
